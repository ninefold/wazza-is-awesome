We received a notification (Zendesk #280) from a customer that they were unable to SSH
into their box, and that their service provider discovered that Skylight
was triggering socket buffer limits.

The customer immediately disabled Skylight, which fixed the bug for him.

Customer Information:

* Using Skylight 0.2.3
* Ruby 2.0.0p353
* Also had New Relic installed (Bug #46)
* Recently upgraded to Rails 4
* Passenger Enterprise with a max-pool size of 12 and zero-downtime deploys
* He had a maxsockbuf of 32MB

The customer also reported 134 open sockets in the server process.

Separately, we discovered that New Relic was making our payloads
extremely large.

Our working hypothesis was that the large New Relic payloads were
triggering the max buffer condition, which was then cascading into more
failures.

Upon further investigation, we discovered a few things:

* If the client hits a kernel buffer limit (via EWOULDBLOCK that lasts
  more than 5s), it closes down its socket
* The server expects to recover from this situation by getting the
  client socket in its read list from IO.select. It would then try to
  read from it, get an EOF, and close the socket.
* If the server does not get the client socket in its read list for some
  (unknown) reason, this would result in an ever-growing list of sockets
  on the server side.

We are not sure why the sockets would not appear in the read list, but
we hypothesize that when the OpenVZ limit is reached, the kernel no
longer includes the socket in the read list, causing the server to never
close the socket.

Mitigation strategies:

* The New Relic fix (#46) should reduce the likelihood of encountering
  this in the first place
* We want to add a Hello heartbeat from the client. If the server
  doesn't receive a message every 1m (or 2m, TBD), it will close the
  socket even if it's not in the read list.

We are worried that if the server process ever gets stuck, this
condition can occur. We are also considering a server heartbeat back to
the clients, so they can take corrective action if the agent gets stuck.

Some mitigations for this situation:

* Kill the server process when a respawn is necessary. This will ensure
  that a stuck agent process doesn't duplicate into N servers.
* Before connecting to the server socket, pre-check the server process 
  with kill -0.

For next time: 
* Request skylight.log for easier debugging
* Form a best practices for customer bug reporting on doc site

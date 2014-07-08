class CreateCensusShapes < ActiveRecord::Migration
  def change
    # These are example tables from a customer database around postgis
    create_table "shapes_postgis", force: true do |t|
      t.string   "shape"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.spatial  "geom",         limit: {:srid=>4269, :type=>"geometry"}
    end

    add_index "census_shapes", ["geom"], :name => "index_on_shape_geoms", :spatial => true
  end
end
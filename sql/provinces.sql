SELECT ST_Transform(the_geom_webmercator, 23095) as the_geom_webmercator,
 cartodb_id, the_geom, name, regiofacetid, level
 FROM provinces
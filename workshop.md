## Web Mapping with Open Source Tools
### [Graphic Hunters](ipam.ucla.edu/programs/long-programs/culture-analytics/)
#### Aurelia Moser, [@auremoser](https://twitter.com/auremoser), aurelia@mozillafoundation.org
**May 11th, 2017**

![EveryCity](https://raw.githubusercontent.com/auremoser/ipam-16/master/img/every-city.jpeg)

Instagram [@chazhutton](https://medium.com/@chazhutton/drawing-the-map-of-every-city-f4b4ea7fa58f#.cmmgckidv)

Find this document here:

* Script: <https://github.com/auremoser/ams-maps-17/workshop.md>
* Github: <https://github.com/auremoser/ams-maps-17>
* Slides: <https://mzl.la/ams-maps>

This workshop will be a light introduction to mapping with open source tools, featuring Open Street Map Data, Carto, Leaflet and other libraries for storing, analyzing and visualizing geospatial data.

### Outline
1. **Mapping Basics**
	+ You are Here.
	+ Types + Topics
	+ Anatomy of a Webmap
2. **Mapping Data**
	+ Formats + Free Sources
	+ Collecting, Sync, Storage
3. **Mapping Tools**
	+ Toolbox: Google, Mapbox, Carto, Leaflet
	+ Mapping in a GUI
		+ Data Import
		+ Customizing UI + CartoCSS
		+ Querying in SQL
		+ Customizing Basemaps
	+ Mapping in Code
		+ APIs / JS Libs
		+ Python
		+ R	
	+ Mapping Movement
		+ Tell Time/Stories: Odyssey + Torque
		+ Partner Graphics: Graphs + Charts
4. **Building a Narrative**
	+ Part 0: [Geology Data: OSM](http://cdb.io/1UPs2Nw)
	+ Part 1: [Earthquake Data](https://auremoser.cartodb.com/viz/f401fa80-2699-11e6-a0ea-0e3ff518bd15/public_map)
		+ [Earthquake Selector Block](http://bl.ocks.org/ohasselblad/b1a6290d109391e75880)
	+ Part 2: [Elephant Migration Data](https://auremoser.cartodb.com/viz/95ea6526-2695-11e6-a16c-0ecfd53eb7d3/public_map)
	+ Sharing your Map
	+ Seeking inspiration
6. **Resources**

### Mapping Basics

#### YOU ARE [HERE](https://map.what3words.com/issue.distract.minds).

![what 3 words](https://raw.githubusercontent.com/auremoser/ams-maps-17/master/img/what3words.png)

Where are you? If I gave you directions here, you could say you were at:

> Mmousse Kromboomsloot 8hs 1011 GV Amsterdam

But if I wanted to describe the location as a point on a map, I might describe the same location using latitude and longitude:

> 52° 22' 20.6508''N 4° 54' 8.784'' E

This reads as "52 degrees, 22 minutes and 20.65 seconds North, 4 degrees, 54 minutes and 8.78 seconds East."

We describe locations with a [spatiotemporal notation](https://en.wikipedia.org/wiki/Longitude_(book)), it's also somewhat obscure. So let's describe the same place using longitude and longitude but using decimal degrees instead of minutes and seconds. There are a number of conversion tools available online to do this:

> 52.372403, 4.90244

####Types + Topics

![Gallery of maps](https://raw.githubusercontent.com/auremoser/gdi-webmap/master/img/gallery.jpg)

There are many different types of map you can make, browse [this gallery](https://carto.com/gallery/) to view some options. Most maps illustrate some kind of geospatial change.

+ **Simple** -- most basic visualization
+ **Cluster** -- counts number of points within a certain binned region
+ **Choropleth** -- makes a histogram of your data and gives bins different colors depending on the color ramp chosen
+ **Category** -- color data based on unique category (works best for a handful of unique types)
+ **Bubble** -- size markers based on column values
+ **Intensity** -- colors by density
+ **Density** -- data aggregated by number of points within a hexagon
+ **Torque** -- temporal visualization of data
+ **Heat** -- more fluid map of concentration; emphasis on far over near-view

**DYNAMIC MAPS**

![Types of Visualizations](https://raw.githubusercontent.com/auremoser/images/master/1-vis-types.png)

Source: [The Data Visualization Catalogue](http://www.datavizcatalogue.com/).

![Time Travel Map](https://raw.githubusercontent.com/auremoser/hasadna/master/img/rainbow.jpg)

Source: [Time Travel Between Counties](http://mdweaver.github.io/times_year/), Carto.JS

**DATA SEARCH TOOLS**
![GDELT Geographic News Search Tool](https://raw.githubusercontent.com/auremoser/140realtime/master/img/gdelt.jpg)

Source: [GDELT Geographic News Search Tool](http://gns.gdeltproject.org/)

Journalists have used [GDELT](http://gdeltproject.org/) data to [track wildlife crime](http://news.nationalgeographic.com/2015/07/150706-wildlife-crime-technology-poaching-endangered-animals/), and the [spread of the Islamic State in the Middle East](http://foreignpolicy.com/2015/06/19/islamc-state-big-data-middle-east/) among other things.

You can fork the GDELT hourly synced data set from the Carto DataLibrary and add it as a layer on your map or use the [Geographic Search Tool](http://blog.gdeltproject.org/announcing-gdelt-geographic-news-search/) linked above to search for tags of interest.

**CHART GRAPHICS**

![County Chart](https://raw.githubusercontent.com/auremoser/hasadna/master/img/chart.jpg)

Source: [Geogia County Car Crash Counts](http://bl.ocks.org/auremoser/6236a61e5383ab0bc71d), C3.JS

**COMPARISON NARRATIVE**

![Michael's Syrian Refugee visualization](https://raw.githubusercontent.com/auremoser/images/master/syria.jpg)
[Map population by relative density](http://projects.aljazeera.com/2013/syrias-refugees/)

**POPULATION TRACKING**

![AMS trend map](https://raw.githubusercontent.com/auremoser/ams-maps-17/master/img/trend-map-nl.png)

Source: [Trends Map](https://www.trendsmap.com/)


* Maps give you more context than most visualizations.
* They allow you to apply data to a recognizable topography.
* They allow you to draw conclusions about a population from it's social and geolocal landscapes.

**Sources**

* [**Carto**](https://carto.com/): light open source library and graphical user interface application for hosting and visualizing geospatial data
* [**ChartJS**](http://www.chartjs.org/): light library for creating charts and graphs
* [**GDELT**](http://gdeltproject.org/): the global database of events languages and tones

#### Anatomy of a WebMap

![Webmap Gif](https://raw.githubusercontent.com/auremoser/gdi-webmap/master/img/slippy.gif)

Source: [Open Street Map](https://www.openstreetmap.org/)

Maps are composed of:

#### 1. Tiles (often)

![Stamen Tiles](https://raw.githubusercontent.com/auremoser/gdi-webmap/master/img/stamen.jpg)

Tiles are 256x256 pixels squares that plot one next to the other to stitch together a pseudo-seamless image; the tiles draw dynamically as you focus and zoom in on your map to progressively build you a seemingly continuous canvas.

#### 2. Feature Layers

Data layers that populate on top of your basemap.

![features](https://raw.githubusercontent.com/auremoser/extract-15/master/img/feature.jpg)

#### 3. Javascript/HTML/CSS for rendering on the web

With these languages, you can publish your map with the base tiles loaded and your data layers appropriately geocoded; with Javascript you can also add to the interactivity of your map, revealing metadata in the tooltips, for example.

### Mapping Data

We'll be working with an assortment of vector point/line/polygon data:

* **POLYGONS**: [Benelux Countries](https://github.com/deldersveld/topojson/blob/master/countries/belgium/benelux-countries.json)
* **POINTS**: [Earthquake Centroids](http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.csv)
* **LINES**: [Elephant Migration Patterns](http://auremoser.cartodb.com/api/v2/sql?q=SELECT%20*%20FROM%20elephant_movements&format=geojson&filename=elephant_movements)

![cali-data](https://raw.githubusercontent.com/auremoser/ipam-16/master/img/cali-data.png)

Here are additional geo-spatial datasets you might want to play with:

topojson converter: http://jeffpaine.github.io/geojson-topojson/
benelux topojson: https://github.com/deldersveld/topojson/blob/master/countries/belgium/benelux-countries.json
* [Columbia University GeoSpatial Datasets](http://library.columbia.edu/locations/dssc/data/nyc.html)
* [World GeoSpatial Datasets](https://github.com/planetopendata/awesome-world): countries, cities, codes, flags, languages, latitude/longitude, etc.
* [Center for National Geographic Information](http://centrodedescargas.cnig.es/CentroDescargas/index.jsp)
* [IDEE Metadata Catalog](http://www.idee.es/csw-inspire-idee/srv/eng/main.home): spatial data from multiple agencies
* [Geogig](http://geogig.org/): distributed geospatial data
* [International GIS Data - Penn State](http://guides.library.upenn.edu/content.php?pid=324392&sid=2655132)

#### Collecting + Sync Tables

We'll be collecting data from multiple sources. Most of which are available in [the repository](https://github.com/auremoser/ams-17/) where our data will be stored.

CartoDB is a Postgres database in the cloud, which means it handles a lot of your backend data needs and allows you to query for data and pull those data and basemap tiles into your front-end code, we'll be using this for part of the workshop to manage hosting easily. It's appropriate to deal with databases when you have multiple datasets you'd like to layer on your map. For single or simple datasets, you can load a file with JQuery/Leaflet. We'll demo both.

![architecture](https://raw.githubusercontent.com/auremoser/ipam-16/master/img/architecture.png)

You can also store your data in Github, or in another service that makes it web accessible. Read more about [that here](https://github.com/blog/1541-geojson-rendering-improvements) and [here](https://github.com/blog/1528-there-s-a-map-for-that).

![github](https://raw.githubusercontent.com/auremoser/ams-maps-17/master/img/benelux-git.png)

### Mapping Tools
![Logos](https://raw.githubusercontent.com/auremoser/ipam-16/master/img/logos.png)

There are loads of ways to approach a map here are a few approaches to mapping the same dataset.

#### Map Making Exercise

We can make a map with the outcrop data, or other data in the [data folder](https://github.com/auremoser/foss4g-cdb/blob/master/outcrop.kml) for this workshop.

**Using Google Maps**

* <https://www.google.com/maps/d/>
* create account if you don't already have a Gmail account
* click on Import Map in top left hand menu (or My Maps -> Create map in some Google Maps UIs)
* upload `outcrop.kml`
* explore changing the map features if you would like

**Using Mapbox**

* <https://mapbox.com/>
* create account if you don't already have a Mapbox account
* click on the Data tab at the top right hand corner of the screen
* click on import
* upload `outcrop.kml`
* select map features if you would like then click on Import Features
* explore changing the map features if you would like

**Using CartoDB**

* <https://carto.com/>
* create account if you don't already have a CartoDB account, [use this URL](https://carto.com/signup?plan=academy) to get boosted features
* click on Create Map; select Map View at the top of the screen
* click on the '+' or Add Layer option at the top of the right side menu
* upload `outcrop.kml`
* explore changing the map features, if you like

**Using Leaflet**

You can also make a map from scratch using [Leaflet.js](http://leafletjs.com/) to attach a set of points to a map made of tiles provided by OpenStreetMap.

You will first need to convert your kml file into GeoJSON (although I have both in the [data folder](https://github.com/copystar/ipam-16/blob/master/data/outcrop.kml)) for this workshop.

GeoJSON is a file format that is easily digestable by JavaScript. If you have a data format (shp, kml) that is not geojson you can convert it to the right format for your code with [GeoJSON.io](http://geojson.io/)/

* go to http://geojson.io/
* from the menu *Open* select *File* and upload our kml file: <https://github.com/copystar/foss4g-cdb/blob/master/outcrop.kml>
* notice how GeoJSON looks like in the side-menu

``` json

	{
	  "type": "FeatureCollection",
	  "generator": "overpass-turbo",
	  "copyright": "The data included in this document is from www.	openstreetmap.org. The data is made available under ODbL.",
	  "timestamp": "2015-09-14T14:05:02Z",
	  "features": [
	    {
	      "type": "Feature",
	      "id": "node/428215780",
	      "properties": {
	        "@id": "node/428215780",
	        "geological": "outcrop",
	        "name": "Sonnberg",
	        "note": "Rocky promontory, subject to erosion. Middle 	Triassic shallow marine limestone, Jena Formation (U.-	Muschelkalk, Wellenkalk). Small outcrop within E-W 	trending graben structure. Contact to MIttlerer 	Buntsandstein exposed in river bed southwest of crag."
	      },
	      "geometry": {
	        "type": "Point",
	        "coordinates": [
	          9.43865,
	          50.6228007
	        ]
	      }
	    },
	    {
	      "type": "Feature",
	      "id": "node/568331113",
	      "properties": {
	        "@id": "node/568331113",
	        "geological": "outcrop",
	        "name": "Monkey rock"
	      },
	      "geometry": {
	        "type": "Point",
	        "coordinates": [
	          177.127952,
	          -17.7323069
	        ]
	      }
	    },

```

* after the map is drawn, from the menu *Save*, select *GeoJSON*"
* refer to "Adding GeoJSON to Leaflet with Link Relations" : http://lyzidiamond.com/posts/osgeo-august-meeting to find the HTML that use can use as a template that will import GeoJSON into a map created by Leaflet.js
* use *http://{s}.tile.osm.org/{z}/{x}/{y}.png* for your map tiles
* use `outcrop.geojson` for your geojson layer: https://github.com/auremoser/ipam-16/blob/master/data/outcrop.geojson
* explore changing the map features if you would like using Leaflet.js: http://leafletjs.com/

![outcrop](https://raw.githubusercontent.com/auremoser/ipam-16/master/img/outcrop-pt.jpg)

Quick [outcrop map by type](http://cdb.io/1UPs2Nw).

### Map Examples in CartoDB
+ [EuroBird Portal](http://www.eurobirdportal.org/ebp/en/#home/TRIGLA/r2013/tm/t2013/)
+ [Alcatraz Escape Revisited](http://www.washingtonpost.com/news/morning-mix/wp/2014/12/15/the-alcatraz-escapees-could-have-survived-and-this-interactive-model-proves-it/)
+ [LA Sheriff Election Results](http://graphics.latimes.com/2014-la-sheriff-primary-map/)
+ [Starwars Galaxy Map](http://www.swgalaxymap.com/)
+ [Demonstrations in Brazil](http://blog.cartodb.com/mapping-the-world-ongoing-demonstrations-in-brazil/)
+ [Global Forest Watch](http://www.globalforestwatch.org/map/3/15.00/27.00/ALL/grayscale/loss,forestgain?begin=2001-01-01&end=2013-12-31&threshold=30)
+ [Urban Reviewer](http://www.urbanreviewer.org/#map=12/40.7400/-73.9998&sidebar=plans)

![urban-interface](https://raw.githubusercontent.com/auremoser/uofm-2015/master/img/urban.png)

![urban-reviewer](https://raw.githubusercontent.com/auremoser/nicar-test/master/img/urban_reviewer_code_example.png)

### Mapping Tools

**Carto** is a Postgres database in the cloud, which means it handles a lot of your backend data needs and allows you to query for data and pull those data and basemap tiles into your front-end code; we'll be using this for the next half of the workshop.

![Basemaps](https://raw.githubusercontent.com/auremoser/140realtime/master/img/basemaps.jpg)

#### Mapping in a GUI

##### You can sign-up for a [Carto Academy Account via this URL](https://carto.com/signup?plan=academy).

The GUI interface for Carto looks as follows:
![dashboard](https://raw.githubusercontent.com/auremoser/extract-15/master/img/dash.jpg)
![data view](https://raw.githubusercontent.com/auremoser/ipam-16/master/img/cali-data.png)
![query view](https://raw.githubusercontent.com/auremoser/ipam-16/master/img/cali-query.png)
![map view](https://raw.githubusercontent.com/auremoser/ipam-16/master/img/cali-choro.png)
![css view](https://raw.githubusercontent.com/auremoser/ipam-16/master/img/cali-cartocss.png)
![share](https://raw.githubusercontent.com/auremoser/ipam-16/master/img/cali-share.png)

You have myriad customization options in the in-browser editor:

* `data` - run sql and postgis functions across your data
* `analysis` - adjust the type, colors and fills in your map
* `style` - customize the css or style of your map with dropdowns/buttons
* `popup` - create hovers, tooltips with information from your datatables
* `legend` - create keys for your map

**DATA IMPORT**

Let's say I import the 50 state polygons from the CartoDB Data Library. I navigate to Datasets > Data Library and search for states:

![Data Library](https://raw.githubusercontent.com/auremoser/ipam-16/master/img/library.png)

It gives me a table I can fork called `ne_50m_admin_1_states`.

**CUSTOMIZING UI + CARTOCSS**

You can customize how those polygons appear with CartoCSS, a CSS flavored language for styling cartographic projects.

There are also a series of presets in the Wizard that write your css for you:

* **Marker Fill:** change the size, color, and opacity of all markers
* **Marker Stroke:** change the width, color, and opacity of every marker's border
* **Composite Operation:** change the color of markers when they overlap
* **Label Text:** Text appearing by a marker (can be from columns)

![css](https://raw.githubusercontent.com/auremoser/ipam-16/master/img/st-css.png)

**QUERYING IN SQL**

Say you want to move Alaska and Hawaii into view because the typical Mercator Projection just isn't cutting it. 

Carto supports PostGIS and SQL functional manipulation of your data in the cloud.

![sql](https://raw.githubusercontent.com/auremoser/ipam-16/master/img/st-sql.png)

**CUSTOMIZING BASEMAPS**

For the above, I made my basemap background one color (`#90cccb`), and added country polygons from the dataset in our common Data Library.

![base](https://raw.githubusercontent.com/auremoser/ipam-16/master/img/st-base.png)

Our `Positron` and `Dark Matter` basemaps are available for free in Leaflet and OpenLayers maps, as well as core Carto maps. Read more about that [here](https://carto.com/basemaps/), and check out documentation on the available Carto Basemaps can be found [here](https://github.com/CartoDB/cartodb/wiki/BaseMaps-available).

#### Mapping in Code

![Plotly](https://raw.githubusercontent.com/auremoser/foss4g-cdb/master/img/plotly.gif)

**JS**

You can read more about the [Carto APIs and JS Library here](https://carto.com/docs)

* [CartoJS](https://carto.com/docs/carto-engine/carto-js) - JS library for interacting with Carto
* [Maps API](https://carto.com/docs/carto-engine/maps-api) - generate public/private maps with data hosted on your CDB account
* [SQL API](https://carto.com/docs/carto-engine/sql-api) - run sql in your code to dynamically filter/request/query your mapped data stored in CartoDB via http calls
* [Import API](https://carto.com/docs/carto-engine/import-api) - push data to your Carto Account

Use also the [CartoDB Uploader](https://www.npmjs.com/package/cartodb-uploader) package available in NPM for working in Node.js

**PYTHON**

Use the [Carto Python module](https://github.com/Vizzuality/cartodb-python) to create and update tables; check out [Andy's Jupyter demos](http://nbviewer.ipython.org/gist/ohasselblad/b2475c95a23c5e070264).

**R**

Use Kyle Walker's [R2CartoDB](https://rpubs.com/walkerke/r2cartodb) project to create and update tables in R.

#### Mapping Movement

**MAPS THAT TELL TIME** - **[Torque](http://docs.cartodb.com/tutorials/introduction_torque.html)**

![Realtime Traffic Map](https://raw.githubusercontent.com/auremoser/140realtime/master/img/muni-animated.gif)

Source: [Traffic Change Data for SF](https://publicdata-transit.firebaseio.com/sf-muni)
Demo: [Municipal Traffic in SF App](http://track-sf-muni.cartodb.io/)
Blog: [CartoDB + Firebase](https://www.firebase.com/blog/2015-04-10-realtime-maps-cartodb-firebase.html)

1. [Demonstrations in Brazil](http://blog.cartodb.com/mapping-the-world-ongoing-demonstrations-in-brazil/)
2. [Animal migration patterns](http://robbykraft.github.io/AnimalTrack/)
3. [Diwali Celebrated](http://bl.ocks.org/anonymous/raw/b9b7c7d6de1c6398e435/)
4. [Ramadan Tweets w/OdysseyJS](http://bl.ocks.org/anonymous/raw/2f1e9a5a74ceeb88e977/)
5. [Alcatraz Escapees](http://www.washingtonpost.com/news/morning-mix/wp/2014/12/15/the-alcatraz-escapees-could-have-survived-and-this-interactive-model-proves-it/?tid=hp_mm&hpid=z3)
6. [Lynching and the Press](http://yale.cartodb.com/u/mdweaver/viz/ffd06ece-8545-11e4-a898-0e018d66dc29/embed_map)

![Elecciones Argentinas](https://raw.githubusercontent.com/auremoser/extract-15/master/img/cambiemos.gif)

Election response in Argentina [post-primary election](https://team.cartodb.com/u/aureliamoser/viz/6144e6a6-7cd7-11e5-a194-0e787de82d45/public_map).

**MAPS THAT TELL STORIES** - **[Odyssey JS](http://cartodb.github.io/odyssey.js/index.html)**

1. [*Al Jazeera*: Israeli-Palestinian Conflict by Tweets](http://stream.aljazeera.com/projects/socialmediaconversation/)
2. [The Sounds of 11M](http://www.cadenaser.com/sonidos-11m/)
3. [Berlin Wall Historic Tour](http://bl.ocks.org/namessanti/raw/d5cf706f68b7c6dce9a3/#3)

##### GRAPHS + CHARTS

You can use CartoDB's SQL API to query your data and pull it into any charting library of your choosing.

You can easily wire up a chart of earthquake depth data for example, set it as a sync table to update continuously, [check the code here](http://bl.ocks.org/auremoser/f469328749368b96c7ca).

![chart](https://raw.githubusercontent.com/auremoser/ipam-16/master/img/chart.png)

Learn more about it [here](http://docs.cartodb.com/tips-and-tricks.html#charts--graphs)!

Here are some examples:

Type | Title | Link/Demo | BlogPost
---- |------ | --------- | ---------
[NVD3](http://nvd3.org/) | NYC Elementary Schools | [Chris' Github](http://chriswhong.github.io/nycSchools/) | 
[Chart.js](http://www.chartjs.org/) Bar Graph | Traffic Data| [Aurelia's Block](http://bl.ocks.org/auremoser/af95a29cd76267d3925e)
[Highcharts](http://www.highcharts.com/) | Sensor Data  | [Github](https://github.com/auremoser/VitalSigns-water/) / [Demo](http://auremoser.github.io/VitalSigns-water/)  | [MOW Post](http://blog.cartodb.com/map-of-the-week-pulse-plotting/)
[Highcharts](http://www.highcharts.com/) | Weather Data | [Aurelia's Block](http://bl.ocks.org/auremoser/96b70f6dbcc724ecc973) | [Tutorial](https://stackedit.io/viewer#!provider=gist&gistId=e2d4f0f0b71f258f3ac9&filename=beirut.md)
[Chart.js](http://www.chartjs.org/) Line Graph | Tornado Data  | [Andrew's Block](http://bl.ocks.org/andrewxhill/9134155)
[Plot.ly](https://plot.ly/) | Earthquake Data  | [Plotly Tutorial](https://plot.ly/ipython-notebooks/cartodb/) | [CartoDB Blog](http://blog.cartodb.com/plotly/)


#### Building a Narrative

#### Part 1: [Earthquake Mapping Data](https://team.cartodb.com/u/aureliamoser/viz/f5e77aac-7edb-11e5-b68c-0ecfd53eb7d3/public_map)

We're going to visualize earthquake data to explore some of the mapping options available to us with a variety of data types.

![Earthquakes + Faults](https://raw.githubusercontent.com/auremoser/extract-15/master/img/quakes.jpg)

Copy the link to the data here (don't download):

```html
http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.csv
```

Import it into your account like this:

![add layer](https://raw.githubusercontent.com/auremoser/extract-15/master/img/dataimport.gif)

**EXPLORE**

![analyzing data](https://raw.githubusercontent.com/auremoser/ipam-16/master/img/pecan-2.png)

We wrote some algorithms to analyze the data you import to suggest maps to make. When you choose one of these, it updates the wizard with all of the styling information.

**MAKE A MULTILAYER MAP**

Now that we've made a map with our earthquakes, let's put a layer of earthquake faults below as a reference.

The data comes from [here](http://earthquake.usgs.gov/hazards/qfaults/), and they made a Leaflet.js map with the dataset [here](http://earthquake.usgs.gov/hazards/qfaults/map/).

**Copy the following link** and add it as a layer to your map:

```html
http://earthquake.usgs.gov/hazards/qfaults/qfaults.zip
```

Looking at the metadata, we could visualize the layers using the slip code attribute that shows the age of the faults, like they do in the [map above](http://earthquake.usgs.gov/hazards/qfaults/map/).

![Multilayer](https://raw.githubusercontent.com/auremoser/extract-15/master/img/q-fault.jpg)

**SPATIAL PROCESSING + SQL**

CartoDB is a tool for geospatial data manipulation and visualization.

SQL is a language for data manipulation. PostGIS is an extension to SQL that has the power to manipulate geospatial data.

##### Basic Syntax

The most basic statement is:

```sql
SELECT * FROM table_name
```

A more detailed query is like this:

```sql
SELECT
  name,
  height,
  age
FROM
  class_list
WHERE
  name IN ('Aurelia', 'Jorgito')
  OR (
    height < 1.8
   AND
    height > 1.6
  )
```

1. `SELECT` is what you're requesting (required)
2. `FROM` is where the data is located (optional -- you can make a table on the fly)
3. `WHERE` is the filter on the data you're requesting (optional)


You can optionally add `LIMIT n` (where n is an integer >= 0), which gives you only n entries, and `ORDER BY column_name ASC`, which sorts in ascending order (`DESC` is another option). 

Using the earthquakes data, you can combine them to give you the top 20 largest earthquakes ordered by strength (`mag`) and, for equal strength, by time.

```sql
SELECT
  place,
  mag,
  time,
  the_geom_webmercator
FROM
  all_month
ORDER BY
  mag DESC, time DESC
LIMIT
  20
```

![Sql](https://raw.githubusercontent.com/auremoser/extract-15/master/img/q-sql.jpg)

##### the_geom, the_geom_webmercator, and cartodb_id

There are two special columns in CartoDB:

1. `the_geom`
2. `the_geom_webmercator`

The first of these is in the units of standard latitude/longitude, while the second is a projection based on the [original Mercator projection](http://en.wikipedia.org/wiki/Mercator_projection) but [optimized for the web](http://en.wikipedia.org/wiki/Web_Mercator).

If you want to run on-the-fly SQL commands and see your map update, make sure to `SELECT` the `the_geom_webmercator` because this is the column that's used for mapping--the other is more of a convenience column since most datasets use lat/long.

If you want to enable interaction on your maps (click events, hover boxes, etc.), you also need to `SELECT` the column called `cartodb_id`.

For instance, the following statement will produce a map with click features:

```sql
SELECT
  the_geom_webmercator,
  place,
  mag,
  cartodb_id
FROM
  all_month
```

##### Functions

+ [Many mathematical functions and constants](http://www.postgresql.org/docs/9.3/static/functions-math.html)
+ [Basic tutorial on using them](http://www.postgresql.org/docs/9.3/static/tutorial-sql.html)

Several are **aggregate functions**, meaning that they need to be grouped by a certain column.

Find the __average__ of the earthquake magnitude as reported by various stations:

```sql
SELECT
  avg(mag) AS avg_mag,
  ST_Transform(ST_Centroid(ST_Union(the_geom)),3857) As the_geom_webmercator,
  net
FROM
  all_month
GROUP BY
  net
```

##### Go Further

Build a tool to execute SQL and CSS instructions on button click, like [this one for earthquake data](http://bl.ocks.org/ohasselblad/b1a6290d109391e75880).

Check out the [Map Academy: Lesson 3](http://academy.cartodb.com/courses/03-cartodbjs-ground-up/lesson-3.html) to learn how to make [this selector map](http://bl.ocks.org/ohasselblad/b1a6290d109391e75880)!


#### Part 2: [Elephant Tracking Data](https://auremoser.cartodb.com/viz/95ea6526-2695-11e6-a16c-0ecfd53eb7d3/public_map)

[Movebank.org](https://www.movebank.org/) has a lots animal tracking data. To get our data, I went to Tracking Data Map, then searched for "Loxodonta africana". But you can easily import it into your account by copying the link below.

We'll be making this map:

![elephant map](https://raw.githubusercontent.com/auremoser/extract-15/master/img/elephant.gif)


1. Create a new Map
2. Import the data into your account from this link:
```html
http://aureliamoser.cartodb.com/api/v2/sql?q=SELECT%20*%20FROM%20elephant_movements&format=geojson&filename=elephant_movements
```

### Animated Elephant Movements

We can see our elephant move around with a Torque visualization.

### Multilayer map with the same data used differently

Let's visualize roughly the paths that the elephants take from point to point. These will be best-guess lines as we don't know the intermediate points. They represent linear interpolations between consecutive points.

We can easily do this with some SQL and PostGIS by pasting in the following command and running it:

```sql
SELECT 
  ST_Transform(
    ST_MakeLine(
      the_geom ORDER BY timestamp),
    3857
  ) As the_geom_webmercator  
FROM 
  elephant_movements
```

and apply the following CartoCSS to visualize our lines better:

```css
#elephant_movements{
  line-color: #41c491;
  line-width: 1;
  line-opacity: 0.7;
  line-smooth: 1.4;
  line-clip: true;
  line-dasharray: 2, 3, 2;
  line-comp-op: multiply;
}
```

![elephant map](https://raw.githubusercontent.com/auremoser/extract-15/master/img/e-1.jpg)

We can get a more nuanced view of the data by using composite operations

```sql
SELECT 
  ST_Transform(
    ST_MakeLine(
      a.the_geom,
      b.the_geom)
    ,3857
  ) As the_geom_webmercator,
  to_char(a.timestamp,'HH12:MI AM, DD Mon') || '--' || to_char(b.timestamp,'HH12:MI AM, DD Mon') As date_range,
  a.cartodb_id
FROM 
  elephant_movements a
JOIN 
  elephant_movements b
ON
  a.cartodb_id + 1 = b.cartodb_id
```

And apply the following CartoCSS to show intensity when lines cross:

```css
#elephant_movements{
  line-color: #41c491;
  line-width: 2;
  line-opacity: 0.7;
  line-comp-op: multiply;
  line-clip: true;
  line-smooth: 1.4;
}
```
![elephant map](https://raw.githubusercontent.com/auremoser/ipam-16/master/img/ele-sql.png)

### RESOURCES

#### Mapping + Carto

1. [CartoCamp Workshops](https://github.com/cartocamp/workshops)
2. [Carto Guides/Trainings](https://carto.com/learn/guides)
3. [Community help on StackExchange](http://gis.stackexchange.com/questions/tagged/carto)
4. [Carto Map Gallery](http://carto.com/gallery/)
5. [Carto Bootstrap Template by Chris Wong](https://github.com/chriswhong/cartodb-github-template)
6. [Friendly Geo Intro by Joey Lee](https://github.com/joeyklee/hellowebmaps)
7. [Lyzi Diamond tutorial on Leaflet](http://lyzidiamond.com/posts/osgeo-august-meeting)

#### Data
1. [World GeoSpatial Datasets](https://github.com/planetopendata/awesome-world): countries, cities, codes, flags, languages, latitude/longitude, etc.
2. [Center for National Geographic Information](http://centrodedescargas.cnig.es/CentroDescargas/index.jsp)
3. [IDEE Metadata Catalog](http://www.idee.es/csw-inspire-idee/srv/eng/main.home): spatial data from multiple agencies
4. [Geogig](http://geogig.org/): distributed geospatial data
5. [International GIS Data - Penn State](http://guides.library.upenn.edu/content.php?pid=324392&sid=2655132)

#### Visualization
1. [Charting Tools Repository](https://github.com/auremoser/chart-tools)
3. [Recommended tools for Visualizations](http://selection.datavisualization.ch/)
4. [Perception Concerns](https://github.com/tmcw/perception)
5. [Gestalt Theory](http://emeeks.github.io/gestaltdataviz/section1.html)
6. [Color Brewer](http://colorbrewer2.org/) or [Geocolor](http://geocolor.io/)
7. [Carto Colors for Meaningful Visualizations](https://carto.com/carto-colors)

If you want to chat with me, or send me some cool maps you've made, just email [aurelia@mozillafoundation.org](mailto:aurelia@mozillafoundation.org).
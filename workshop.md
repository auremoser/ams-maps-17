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
	+ Data Collecting, Sync, Storage
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
4. **Building a Visual Narrative**
	+ Part 1: [Spatial Analysis](https://auremoser.carto.com/builder/f401fa80-2699-11e6-a0ea-0e3ff518bd15/embed)
	+ Part 2: [Special Styling](https://auremoser.carto.com/builder/3547901b-c69d-4375-b868-afbd86e651b3/embed)
5. **Resources**

## Mapping Basics

#### YOU ARE [HERE](https://map.what3words.com/issue.distract.minds).

![what 3 words](https://raw.githubusercontent.com/auremoser/ams-maps-17/master/img/what3words.png)

Where are you? If I gave you directions here, you could say you were at:

> Mmousse Kromboomsloot 8hs 1011 GV Amsterdam

But if I wanted to describe the location as a point on a map, I might describe the same location using latitude and longitude:

> 52° 22' 20.6508''N 4° 54' 8.784'' E

This reads as "52 degrees, 22 minutes and 20.65 seconds North, 4 degrees, 54 minutes and 8.78 seconds East."

We describe locations with a [spatiotemporal notation](https://en.wikipedia.org/wiki/Longitude_(book)), it's also somewhat obscure. So let's describe the same place using longitude and longitude but using decimal degrees instead of minutes and seconds. There are a number of conversion tools available online to do this:

> 52.372403, 4.90244

### Types + Topics

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

#### Dynamic Maps

![Types of Visualizations](https://raw.githubusercontent.com/auremoser/images/master/1-vis-types.png)

Source: [The Data Visualization Catalogue](http://www.datavizcatalogue.com/).

![Time Travel Map](https://raw.githubusercontent.com/auremoser/hasadna/master/img/rainbow.jpg)

Source: [Time Travel Between Counties](http://mdweaver.github.io/times_year/), Carto.JS

#### Data Search Tools
![GDELT Geographic News Search Tool](https://raw.githubusercontent.com/auremoser/140realtime/master/img/gdelt.jpg)

Source: [GDELT Geographic News Search Tool](http://gns.gdeltproject.org/)

Journalists have used [GDELT](http://gdeltproject.org/) data to [track wildlife crime](http://news.nationalgeographic.com/2015/07/150706-wildlife-crime-technology-poaching-endangered-animals/), and the [spread of the Islamic State in the Middle East](http://foreignpolicy.com/2015/06/19/islamc-state-big-data-middle-east/) among other things.

You can fork the GDELT hourly synced data set from the Carto DataLibrary and add it as a layer on your map or use the [Geographic Search Tool](http://blog.gdeltproject.org/announcing-gdelt-geographic-news-search/) linked above to search for tags of interest.

#### Chart Graphics

![County Chart](https://raw.githubusercontent.com/auremoser/hasadna/master/img/chart.jpg)

Source: [Geogia County Car Crash Counts](http://bl.ocks.org/auremoser/6236a61e5383ab0bc71d), C3.JS

#### Comparison Narrative

![Michael's Syrian Refugee visualization](https://raw.githubusercontent.com/auremoser/images/master/syria.jpg)
[Map population by relative density](http://projects.aljazeera.com/2013/syrias-refugees/)

#### Population Survey

![AMS trend map](https://raw.githubusercontent.com/auremoser/ams-maps-17/master/img/trend-map-nl.png)

Source: [Trends Map](https://www.trendsmap.com/)


* Maps give you more context than most visualizations.
* They allow you to apply data to a recognizable topography.
* They allow you to draw conclusions about a population from it's social and geolocal landscapes.

**Sources**

* [**Carto**](https://carto.com/): light open source library and graphical user interface application for hosting and visualizing geospatial data
* [**ChartJS**](http://www.chartjs.org/): light library for creating charts and graphs
* [**GDELT**](http://gdeltproject.org/): the global database of events languages and tones

### Anatomy of a WebMap

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

## Mapping Data

We'll be working with an assortment of vector point/line/polygon data.

Here are additional geo-spatial datasets you might want to play with:

* [Global Administrative Areas Datasets](http://www.gadm.org/download)
* [National Geo-register - Netherlands](http://www.nationaalgeoregister.nl/geonetwork/srv/dut/catalog.search#/home)
* [World GeoSpatial Datasets](https://github.com/planetopendata/awesome-world): countries, cities, codes, flags, languages, latitude/longitude, etc.
* [Center for National Geographic Information](http://centrodedescargas.cnig.es/CentroDescargas/index.jsp)
* [IDEE Metadata Catalog](http://www.idee.es/csw-inspire-idee/srv/eng/main.home): spatial data from multiple agencies
* [Geogig](http://geogig.org/): distributed geospatial data
* [International GIS Data - Penn State](http://guides.library.upenn.edu/content.php?pid=324392&sid=2655132)
* [Benelux Countries JSON](https://github.com/deldersveld/topojson/blob/master/countries/belgium/benelux-countries.json)
	* [Topojson converter](http://jeffpaine.github.io/geojson-topojson/)

### Data Collection & Syncing

We'll be collecting data from multiple sources. Most of which are available in [the repository](https://github.com/auremoser/ams-17/) where our data will be stored.

CartoDB is a Postgres database in the cloud, which means it handles a lot of your backend data needs and allows you to query for data and pull those data and basemap tiles into your front-end code, we'll be using this for part of the workshop to manage hosting easily. It's appropriate to deal with databases when you have multiple datasets you'd like to layer on your map. For single or simple datasets, you can load a file with JQuery/Leaflet. We'll demo both.

![architecture](https://raw.githubusercontent.com/auremoser/ipam-16/master/img/architecture.png)

You can also store your data in Github, or in another service that makes it web accessible. Read more about [that here](https://github.com/blog/1541-geojson-rendering-improvements) and [here](https://github.com/blog/1528-there-s-a-map-for-that).

![github](https://raw.githubusercontent.com/auremoser/ams-maps-17/master/img/benelux-git.png)

## Mapping Tools
![Logos](https://raw.githubusercontent.com/auremoser/ipam-16/master/img/logos.png)

There are loads of ways to approach a map here are a few approaches to mapping the same dataset.

### Multi-Tool Exercise

We can make a map with the province polygon data, or other data in the [data folder](https://github.com/auremoser/ams-maps-17/blob/master/data/nl_adm1.kmz) for this workshop.

**Using Google Maps**

* <https://www.google.com/maps/d/>
* create account if you don't already have a Gmail account
* click on Import Map in top left hand menu (or My Maps -> Create map in some Google Maps UIs)
* upload `nl_adm1.kmz`
* explore changing the map features if you would like

**Using Mapbox**

* <https://mapbox.com/>
* create account if you don't already have a Mapbox account
* click on the Data tab at the top right hand corner of the screen
* click on import
* upload `nl_adm1.kmz`
* select map features if you would like then click on Import Features
* explore changing the map features if you would like

**Using Carto**

* <https://carto.com/>
* create account if you don't already have a CartoDB account, [use this URL](https://carto.com/signup?plan=academy) to get boosted features
* click on Create Map; select 'Connect Dataset'
* upload `nl_adm1.kmz`
* explore changing the map features, if you like

**Using Leaflet**

You can also make a map from scratch using [Leaflet.js](http://leafletjs.com/) to attach a set of points to a map made of tiles provided by OpenStreetMap.

You will first need to convert your kmz file into GeoJSON (although I have both in the [data folder](https://github.com/auremoser/ams-maps17/blob/master/data/nl_adm1.kmz)) for this workshop.

GeoJSON is a file format that is easily digestable by JavaScript. If you have a data format (shp, kml, kmz) that is not geojson you can convert it to the right format for your code with [GeoJSON.io](http://geojson.io/)/

* refer to "Adding GeoJSON to Leaflet with Link Relations" : <http://lyzidiamond.com/posts/osgeo-august-meeting> to find the HTML that use can use as a template that will import GeoJSON into a map created by Leaflet.js
* use *http://{s}.tile.osm.org/{z}/{x}/{y}.png* for your map tiles
* use `nl-provinces.geojson` for your geojson layer: <https://github.com/auremoser/ams-maps17/blob/master/data/nl-provinces.geojson>
* explore changing the map features if you would like using Leaflet.js: <http://leafletjs.com/>

### Carto

**Carto** is a Postgres database in the cloud, which means it handles a lot of your backend data needs and allows you to query for data and pull those data and basemap tiles into your front-end code; we'll be using this for the next half of the workshop.

![Basemaps](https://raw.githubusercontent.com/auremoser/140realtime/master/img/basemaps.jpg)

### Mapping in a GUI

You can sign-up for a [Carto Academy Account via this URL](https://carto.com/signup?plan=academy).

The GUI interface for Carto looks as follows:
![maps view](https://raw.githubusercontent.com/auremoser/ams-maps-17/master/img/dash-view.png)

You have myriad customization options in the in-browser editor:

* `data` - run sql and postgis functions across your data
* `analysis` - adjust the type of aggregate/auto-analysis you apply
* `style` - customize the css or style of your map with dropdowns/buttons
* `popup` - create hovers, tooltips with information from your datatables
* `legend` - create keys for your map

**Data Import**

Let's say I import the Netherlandish provinces polygons, those are available in the `data/` folder of with workshop repo: `n-provinces.geojson`. 

You can also navigate to the Data Library in Carto and find some prefab datasets that you can fork into your account: Datasets > Data Library.

![Data Library](https://raw.githubusercontent.com/auremoser/ipam-16/master/img/library.png)

**Customizing UI + CartoCSS**

You can customize how those polygons appear with CartoCSS, a CSS flavored language for styling cartographic projects.

There are also a series of presets in the Wizard that write your css for you:

* **Marker Fill:** change the size, color, and opacity of all markers
* **Marker Stroke:** change the width, color, and opacity of every marker's border
* **Composite Operations:** change the color of markers when they overlap
* **Label Text:** Text appearing by a marker (can be from columns)

I've loaded some example css in the `css/` folder of this workshop repo, that you can copy into the CSS GUI in carto if you upload the provinces dataset: `css/provinces.css`.

![css](https://raw.githubusercontent.com/auremoser/ams-maps-17/master/img/ams-regions-css.png)

**Querying in SQL**

Say you want to reproject the Netherlands in the appropriate ESPG code because the typical Mercator Projection isn't satisfying. 

Carto supports PostGIS and SQL functional manipulation of your data in the cloud.

![sql](https://raw.githubusercontent.com/auremoser/ams-maps-17/master/img/ams-reproj2.png)

**Customizing Basemaps**

You can then change the basemap to a color (`#000000`) so that the projection doesn't look terrible with the underlying mercator country outlines.

![base](https://raw.githubusercontent.com/auremoser/ams-maps-17/master/img/ams-blk-basemap.png)

Carto's `Positron` and `Dark Matter` basemaps are available for free in Leaflet and OpenLayers maps, as well as core Carto maps. Read more about that [here](https://carto.com/basemaps/), and check out documentation on the available Carto Basemaps can be found [here](https://github.com/CartoDB/cartodb/wiki/BaseMaps-available).

### Mapping in Code

![Plotly](https://raw.githubusercontent.com/auremoser/foss4g-cdb/master/img/plotly.gif)

**JS**

You can read more about the [Carto APIs and JS Library here](https://carto.com/docs)

* [CartoJS](https://carto.com/docs/carto-engine/carto-js) - JS library for interacting with Carto
* [Maps API](https://carto.com/docs/carto-engine/maps-api) - generate public/private maps with data hosted on your CDB account
* [SQL API](https://carto.com/docs/carto-engine/sql-api) - run sql in your code to dynamically filter/request/query your mapped data stored in CartoDB via http calls
* [Import API](https://carto.com/docs/carto-engine/import-api) - push data to your Carto Account

Use also the [CartoDB Uploader](https://www.npmjs.com/package/cartodb-uploader) package available in NPM for working in Node.js

**Python**

Use the [Carto Python module](https://github.com/Vizzuality/cartodb-python) to create and update tables; check out [Andy's Jupyter demos](http://nbviewer.ipython.org/gist/ohasselblad/b2475c95a23c5e070264).

**R**

Use Kyle Walker's [R2CartoDB](https://rpubs.com/walkerke/r2cartodb) project to create and update tables in R.

### Mapping Movement

**MAPS THAT TELL TIME** - **[Torque](http://docs.cartodb.com/tutorials/introduction_torque.html)**

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

### GRAPHS + CHARTS

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

## Building a Visual Narrative

### Part 1: [Spatial Analysis](https://auremoser.carto.com/builder/f401fa80-2699-11e6-a0ea-0e3ff518bd15/embed)

We're going to visualize earthquake data to explore some of the mapping options available to us with a variety of data types.

![Earthquakes + Faults](https://raw.githubusercontent.com/auremoser/extract-15/master/img/quakes.jpg)

## Data Import

Copy the link to the data here (don't download):

```html
http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.csv
```

Import it into your account like this:

![add layer](https://raw.githubusercontent.com/auremoser/extract-15/master/img/dataimport.gif)

Now that we've made a map with our earthquakes, let's put a layer of earthquake faults below as a reference.

The data comes from [here](http://earthquake.usgs.gov/hazards/qfaults/), and they made a Leaflet.js map with the dataset [here](http://earthquake.usgs.gov/hazards/qfaults/map/).

**Copy the following link** and add it as a layer to your map:

```html
http://earthquake.usgs.gov/hazards/qfaults/qfaults.zip
```

Looking at the metadata, we could visualize the layers using the slip code attribute that shows the age of the faults, like they do in the [map above](http://earthquake.usgs.gov/hazards/qfaults/map/).

![Multilayer](https://raw.githubusercontent.com/auremoser/ams-maps-17/master/img/quake-faults.png)

## SQL + Spatial Processing
**SPATIAL PROCESSING + SQL**

CartoDB is a tool for geospatial data manipulation and visualization.

SQL is a language for data manipulation. PostGIS is an extension to SQL that has the power to manipulate geospatial data.

### Basic SQL Syntax

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
  name IN ('Aurelia', 'Andy')
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

![Sql](https://raw.githubusercontent.com/auremoser/ams-maps-17/master/img/quakes.png)

### Quirks of Carto

There are two special columns in Carto:

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

### SQL/POSTGIS Functions

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

## Part 2: [Special Styling](https://auremoser.carto.com/builder/3547901b-c69d-4375-b868-afbd86e651b3/embed)

Sometimes you want to provide extra styling flair to maps, and you can do that in CartoCSS and SQL.

We'll do something not unlike this inspiration print map:

![submarine cable map](https://raw.githubusercontent.com/auremoser/ams-maps-17/master/img/submarinecablemap.png)

## Data + Tiles

+ [.carto file](https://drive.google.com/file/d/0B9k_lcYQZACgY1k2RHV3MGx3MTg/view?usp=sharing)
+ tile image url: `https://raw.githubusercontent.com/auremoser/ams-maps-16/master/img/land_paper.png`

## Data Import

Import `.carto` file above into your account - it's a zip package with a couple of layers
* Open the map
* Rename your map as *Vintage Africa Map*.
* Order and rename your layers as follows:
  * *ne_50m_admin_0_countries* > *Countries*
  * *continent* > *Continent*
  * *ne_50m_ocean* > *Ocean*

Select Africa:

* Click on *ADD ANALYSIS* just below *Continent* layer name
* Select *Filter by column value*
* Click on *ADD ANALYSIS*
* Set parameters as folows:
  * *COLUMN*: `continent`
  * *INPUT*: `Africa`
  * *RESULT*: *Show*
* Click on *APPLY*

## Styling

Create coastal ripple effect:

* Click on *+* symbol button to add a new analysis 
* Select *Create  Areas of influence*
* Click on *ADD ANALYSIS*
* Set parameters as folows:
  * *TYPE*: *Distance*
  * *UNITS*: *miles*
  * *RADIUS*: `100`
  * *TRACTS*: `6`
  * *BOUNDARIES*: *Intact*
* Hit *APPLY*

Style:

* Go to *STYLE* tab
* Use the slider button to open CartoCSS view
* Apply this code:

  ```css
  #layer{
    line-width: ramp([data_range],0.4,1,equal);
    line-color: teal;
    line-opacity: 0.5;
  }
  ```

### Global Styles

In order to style all countries by categories and using a pattern file follow these instructions:

* Go back to *LAYERS* pane
* Click on *Countries* layer
* Go to *STYLE* tab
* Open CartoCSS view by clickin the slider button
* Apply this code:

  ```css
  #layer{
    polygon-pattern-file: url(https://s3.amazonaws.com/com.cartodb.users-assets.production/production/mamatablog/assets/20151025140245land_paper.png);
    polygon-pattern-opacity: 0.3;
    polygon-fill: ramp([mapcolor7], cartocolor(Bold), category(7));
    polygon-opacity: 0.2;
  }
  ```

![africa countries](https://raw.githubusercontent.com/auremoser/ams-maps-17/master/img/africa-countries.png)

### Africa Styles

In order to highlight African countries add the following snippet at the end of the CartoCSS code. It will improve some cartographic-related issues, as line's color and offset, as well as labels.

```css
  [continent='Africa']{ 
    polygon-opacity: 0.3;
    line-width: 2;
    line-color: ramp([mapcolor7], cartocolor(Bold), category(7));
    line-opacity: 0.4;
    line-offset: -1;

    ::labels  {
    text-name: [abbrev];
    text-face-name: 'Gravitas One Regular';
    text-size: 10;
    text-fill: #000;
    text-label-position-tolerance: 0;
    text-halo-radius: 0;
    text-halo-fill: #6F808D;
    text-dy: 0;
    text-allow-overlap: true;
    text-placement: point;
    text-placement-type: dummy;
    text-transform: uppercase;
    text-character-spacing: 0.5;
    text-wrap-width: 25;
    }
  }
```

### Ocean Styles

In order to style *Ocean* layer:

* Go back to *LAYERS* pane
* Click on *Ocean* layer
* Go to *STYLE* tab
* Open CartoCSS view by clicking the slider button
* Apply this code:

```css
#layer{
  polygon-fill: lighten(#b3d1cf,0);
  polygon-pattern-file: url(https://s3.amazonaws.com/com.cartodb.users-assets.production/production/mamatablog/assets/20151025140245land_paper.png);
  polygon-pattern-opacity: 0.4;
}
```

### Basemap

Finally, go back to *LAYERS* pane to style the basemap:

* Click on *Positron*.
* Set *COLOR* as *Source*
* Set `#c3d1c7` as *HEX* value.

![africa basemap](https://raw.githubusercontent.com/auremoser/ams-maps-17/master/img/africa-basemap.png)

## Publish

Go back to *LAYERS* pane in order to share your map:

* Click on *SHARE*
* Click on *PUBLISH* blue button
* Click on *PUBLISH* (below)
* Copy the link and paste it in a new browser tab: [https://auremoser.carto.com/builder/3547901b-c69d-4375-b868-afbd86e651b3/embed](https://auremoser.carto.com/builder/3547901b-c69d-4375-b868-afbd86e651b3/embed)

![africa final map](https://raw.githubusercontent.com/auremoser/ams-maps-17/master/img/africa-final.png)


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
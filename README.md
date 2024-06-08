<header>

<!--
  <<< Author notes: Course header >>>
  Include a 1280×640 image, course title in sentence case, and a concise description in emphasis.
  In your repository settings: enable template repository, add your 1280×640 social image, auto delete head branches.
  Add your open source license, GitHub uses MIT license.
-->

# ProcGen

_A Simple Procedural Generation Library for GameMakerStudio_

</header>

<!--
  <<< Author notes: Step 1 >>>
  Choose 3-5 steps for your course.
  The first step is always the hardest, so pick something easy!
  Link to docs.github.com for further explanations.
  Encourage users to open new tabs for steps!
-->

## Installation

To use this library in your GameMaker Studio project, first import the `ProcGen.yymps` file by going to `Tools` -> `Import Local Package`. Then you may check the example project and use the scripts.

## Usage

### Initialization

To initialize a level with default terrain, use the `procgen_init_level(width, height, def_terrain)` function.

```gml
var grid = procgen_init_level(20, 20, 0); // Initialize a 20x20 grid with default terrain type 0
```
### Generating Terrain
Individual cells can be changed with `procgen_set_cell()`.

```gml
levelGrid[# col, row] = procgen_set_cell(col, row, terrain_type);
```

You can generate different shapes of terrain using various functions such as `procgen_make_rectangle()` and `procgen_make_circle()`.

```gml
levelGrid1 = procgen_make_rectangle(grid, 5, 5, 10, 10, 1); // Generate a rectangle of terrain type 1 at position (5, 5) with size 10x10 & terrain type 1
levelGrid2 = procgen_make_circle(grid, 15, 15, 5, 2);       // Generate a circle of terrain type 2 at position (15, 15) with radius 5 & terrain type 2
```

A grid of perlin noise can be generated with `procgen_perlin_noise(width, height, lower_limit, upper_limit, increment, seed)`

```gml
levelGrid = procgen_perlin_noise(20, 20, 0, 6, .01, random(100));
// Generate a 20x20 grid of perlin noise the the cell terrain ranging from 0-6 with a random seed
```

### Blending Grids
Grids may be combined by using `procgen_minimum_grids()` & `procgen_maximize_grids`.

```gml
levelGrid = procgen_minimum_grids(grid1, grid2);
// this will take the minimum terrain values from grid1 & grid2 then store it in the same location in levelGrid
```

### Drawing Terrain
Once a grid is generated, it can be drawn to a tile layer using the procgen_draw_tilemap() function.

```gml
var tilemap = layer_tilemap_get_id("Terrain"); // Get the tilemap layer
procgen_draw_tilemap(levelGrid, tilemap);      // Draw the generated terrain on the tilemap
```

<footer>

<!--
  <<< Author notes: Footer >>>
  Add a link to get support, GitHub status page, code of conduct, license link.
-->

---



</footer>

/* Parametric compartment box by Tomi T. Salo <ttsalo@iki.fi> 2011. */


/* columns: the number of compartments in the X-direction.
   rows: the number of compartments in the Y-direction.
*/
columns =2;
rows = 3;
columnWidth = 20;
rowHeight = 20; 
/*
   columnWidth: the internal width of each compartment (in the X-direction).
   rowHeight: the internal height of each compartment (in the Y-direction). 
   boxThickness: the internal thichness of the compartments (in the 
     Z-direction).
   bottomThickness: the thickness of the bottom material.
   topThickness: the thickness of the top material.
   outerWallThickness: the thickness of the outer walls of the bottom 
     section and the outer lip of the top section.
   innerWallThickness: the thickness of the internal walls between 
     compartments.
   topLipThickness: the thickness of the short walls protruding into 
     the compartments.
   topLipHeight: the height of the short walls protruding into the 
     compartments.
   topFitTolerance: extra space between the bottom section parts and the 
     corresponding grooves in the top section (this much between every edge). 
*/

module compartmentBox(columns, rows, columnWidth, rowHeight, boxThickness, 
                      bottomThickness, topThickness, outerWallThickness, 
                      innerWallThickness, topLipThickness, topLipHeight, 
                      topFitTolerance, isBottom) {
  if (isBottom)
    {
      /* The bottom section is modelled by one big cube with the compartments
         subtracted out. */
      difference() {
        cube([columns * columnWidth + (columns - 1) * innerWallThickness + 
              2 * outerWallThickness,
              rows * rowHeight + (rows - 1) * innerWallThickness + 
              2 * outerWallThickness,
              bottomThickness + boxThickness], center = false);
        for (i = [0 : (columns - 1)])
          {
            for (j = [0 : (rows - 1)])
              {
                translate([outerWallThickness + (columnWidth + 
                                                 innerWallThickness) * i,
                           outerWallThickness + (rowHeight + 
                                                 innerWallThickness) * j,
                           bottomThickness+2])
                 minkowski()
                {
                  cube([columnWidth -2 , rowHeight-2, boxThickness-2]);
                  sphere(r=1);
                } 
              }
          }
      }
    } else {
    /* The top is made of an union of: 
       1) Top plate 
       2) Outer top lip made with a difference
       3) Internal compartment lips each made by subtracting the hollow 
          portion out of a solid block. */
    union() {
      translate([-topFitTolerance, -topFitTolerance, 0])
        cube([columns * columnWidth + (columns - 1) * innerWallThickness + 
              2 * outerWallThickness + 2 * topFitTolerance,
              rows * rowHeight + (rows - 1) * innerWallThickness + 
              2 * outerWallThickness +
	      2 * topFitTolerance, topThickness], center = false);
      difference () {
        translate([-(outerWallThickness + topFitTolerance) , 
                   -(outerWallThickness + topFitTolerance), 0])
          cube([columns * columnWidth + (columns - 1) * innerWallThickness + 
                4 * outerWallThickness + 2 * topFitTolerance,
                rows * rowHeight + (rows - 1) * innerWallThickness + 
                4 * outerWallThickness +
                2 * topFitTolerance,
                topThickness + topLipHeight], center = false);
        translate([-topFitTolerance, -topFitTolerance, 0])
          cube([columns * columnWidth + (columns - 1) * innerWallThickness + 
                2 * outerWallThickness + 2 * topFitTolerance,
                rows * rowHeight + (rows - 1) * innerWallThickness + 
                2 * outerWallThickness + 2 * topFitTolerance,
                topThickness + topLipHeight], center = false);
      }
      for (i = [0 : (columns - 1)])
        {
          for (j = [0 : (rows - 1)])
            {
              difference () {
                translate([outerWallThickness + (columnWidth + 
                                                 innerWallThickness) * i +
                           topFitTolerance,
                           outerWallThickness + (rowHeight + 
                                                 innerWallThickness) * j +
                           topFitTolerance,
                           topThickness]) 
                  cube([columnWidth - 2 * topFitTolerance , 
                        rowHeight - 2 * topFitTolerance, topLipHeight]);
                translate([outerWallThickness + (columnWidth + 
                                                 innerWallThickness) * i + 
                           topLipThickness + topFitTolerance,
                           outerWallThickness + (rowHeight + 
                                                 innerWallThickness) * j +
                           topLipThickness + topFitTolerance,
                           topThickness]) cube([columnWidth - 
                                                2 * topLipThickness - 
                                                2 * topFitTolerance, 
                                                rowHeight - 
                                                2 * topLipThickness - 
                                                2 * topFitTolerance, 
                                                topLipHeight]);
              }
            }
        }
    }
  }
}

compartmentBox(
    columns,
    rows,
    columnWidth,
    rowHeight,
    20, 1, 1, 2*.45, 2*.45, 2*.45, 4, 0.4, true);
translate([(columns + 1)*columnWidth,0,0])compartmentBox(
    columns,
    rows,
    columnWidth, 
    rowHeight, 20, 1, 1, 2*.45, 2*.45, 2*.45, 4, 0.4, false);


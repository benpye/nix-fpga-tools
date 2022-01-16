({
  graphical = [
    {
      name = "Analyzer";
      icon = "analyzer.ico";
      exec = "analyzer";
    }
    {
      name = "CompXlib";
      icon = "compxlib.ico";
      exec = "compxlibgui";
    }
    {
      name = "Constraints Editor";
      icon = "constraints_editor.ico";
      exec = "constraints_editor";
    }
    {
      name = "CORE Generator";
      icon = "coregen.ico";
      exec = "coregen";
    }
    {
      name = "FPGA Editor";
      icon = "fpga_editor.ico";
      exec = "fpga_editor";
    }
    {
      name = "iMPACT";
      icon = "impact.ico";
      exec = "impact";
    }
    {
      name = "Inserter";
      icon = "inserter.ico";
      exec = "inserter";
    }
    {
      name = "Project Navigator";
      icon = "projnav.ico";
      exec = "ise";
    }
    {
      name = "Timing Analyzer";
      icon = "timinganalyzer.ico";
      exec = "timingan";
    }
    {
      name = "XPower Analyzer";
      icon = "xpa.ico";
      exec = "xpa";
    }
  ];

  commandLine = [
    "partgen" "netgen" "ngdbuild" "map" "drc" "par" "smartxplorer" "xpwr"
    "pin2ucf" "trce" "speedprint" "bitgen" "bsdlanno" "promgen" "ibiswriter"
    "cpldfit" "tsim" "taengine" "hprep6" "xflow" "ngcbuild" "compxlib"
    "edif2ngd" "xst"
  ];
})

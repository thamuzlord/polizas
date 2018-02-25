<head>
    <meta charset="utf-8">
    <title>Pólizas</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="styles/bootstrap.css" rel="stylesheet">
    <link href="styles/main.css" rel="stylesheet">
    <link href="styles/font-style.css" rel="stylesheet">
    <link href="styles/flexslider.css" rel="stylesheet">
    <link href="libs/ionicons/css/ionicons.min.css" rel="stylesheet">
    <link href="styles/dataTables.bootstrap.css">
    <link href="styles/select2.min.css">
    <style type="text/css">
      body {
        padding-top: 60px;
      }
    </style>
    <script type="text/javascript" src="libs/jquery-3.3.1/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="js/polizas.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="js/dataTables.bootstrap.js"></script>
    <link href="http://fonts.googleapis.com/css?family=Raleway:400,300" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css">
    <?php
      if(existe("mods/".@$_GET["name"]."/plugins.php"))
        {
          include("mods/".$_GET["name"]."/plugins.php");
        }

      if(existe("mods/".@$_GET["name"]."/plugins.js"))
        {
          echo "<script language='JavaScript'>";
          include("mods/".$_GET["name"]."/plugins.js");
          echo "</script>";
        }
    ?>
</head>

    $(function () {
      $("#example1").DataTable({
        "paging": true,
        "lengthChange": true,
        "searching": true,
        "info": true,
        "autoWidth": true,
        "scrollX": true,
        "lengthMenu": [[5, 25, 50, -1], [5, 25, 50, "Todos"]],
        "order": [[ 2, "desc" ],[ 3, "desc" ]],
        "language": {
          "url": "js/Spanish.json"
        }
      });
    });

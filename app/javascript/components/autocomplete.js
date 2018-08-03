function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    const boardLocation = document.getElementById('board_location');

    if (boardLocation) {
      const autocomplete = new google.maps.places.Autocomplete(boardLocation, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(boardLocation, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };

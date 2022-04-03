document.addEventListener("turbolinks:load", function () {

  var options = {
    url: function (phrase) {
      return "/autocomplete/search.json?q=" + phrase;
    },
    getValue: "name",
  };

  console.log(options);
  console.log('options defined');
  $('*[data-behavior="autocomplete"]').easyAutocomplete(options);
  console.log('autocomplete targeted');
});

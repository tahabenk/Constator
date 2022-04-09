document.addEventListener("turbolinks:load", function () {

  var options = {
    url: function (phrase) {
      return "/autocomplete/search.json?q=" + phrase;
    },
    getValue: "name",
  };

  console.log(options);
  $('*[data-behavior="autocomplete"]').easyAutocomplete(options);
});

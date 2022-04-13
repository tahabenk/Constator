// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
console.log('Hello from application.js')

import "signature_pad"
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "controllers"
import "bootstrap"
import "easy-autocomplete"
import "packs/driver_autocomplete"
import "packs/signature"
import flatpickr from "flatpickr";

import { initMapbox } from '../plugins/init_mapbox';

document.addEventListener('turbolinks:load', () => {
  initMapbox();
  flatpickr("#report_accident_datetime", {
    enableTime: true,
    dateFormat: "Y-m-d H:i",
  });
})

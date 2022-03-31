// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import Chart from 'chart.js/auto';
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "controllers"
import "bootstrap"

console.log('Chart', Chart)

document.addEventListener("turbolinks:load", function() {
  loadChart();
});

const loadChart = () => {

  var xData = document.getElementById('chart-x-data').dataset;
  var yData = document.getElementById('chart-y-data').dataset;

  var ctx = document.getElementById('myChart');
  var myChart = new Chart(ctx, {
      type: 'bar',
      data: {
          labels: [xData.m1, xData.m2, xData.m3, xData.m4, xData.m5, xData.m6, xData.m7, xData.m8, xData.m9, xData.m10, xData.m11, xData.m12],
          datasets: [{
              label: 'Revenue in k€',
              data: [yData.m1, yData.m2, yData.m3, yData.m4, yData.m5, yData.m6, yData.m7, yData.m8, yData.m9, yData.m10, yData.m11, yData.m12],
              backgroundColor: [
                  'rgba(237, 137, 137, 0.2)',
                  'rgba(237, 137, 137, 0.2)',
                  'rgba(237, 137, 137, 0.2)',
                  'rgba(237, 137, 137, 0.2)',
                  'rgba(237, 137, 137, 0.2)',
                  'rgba(237, 137, 137, 0.2)',
                  'rgba(237, 137, 137, 0.2)',
                  'rgba(237, 137, 137, 0.2)',
                  'rgba(237, 137, 137, 0.2)',
                  'rgba(237, 137, 137, 0.2)',
                  'rgba(237, 137, 137, 0.2)',
                  'rgba(237, 137, 137, 0.2)'
              ],
              borderColor: [
                  'rgba(237, 137, 137, 1))',
                  'rgba(237, 137, 137, 1))',
                  'rgba(237, 137, 137, 1))',
                  'rgba(237, 137, 137, 1))',
                  'rgba(237, 137, 137, 1))',
                  'rgba(237, 137, 137, 1))',
                  'rgba(237, 137, 137, 1))',
                  'rgba(237, 137, 137, 1))',
                  'rgba(237, 137, 137, 1))',
                  'rgba(237, 137, 137, 1))',
                  'rgba(237, 137, 137, 1))',
                  'rgba(237, 137, 137, 1))'
              ],
              borderWidth: 1
          }]
      },
      options: {
          scales: {
              yAxes: [{
                  ticks: {
                      beginAtZero: true
                  }
              }]
          }
      }
  });

};

const colors = require("tailwindcss/colors");

/**@type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./components/**/*.{js,vue,ts}",
    "./layouts/**/*.vue",
    "./pages/**/*.vue",
    "./plugins/**/*.{js,ts}",
    "./nuxt.config.{js,ts}",
    "./content/**/*.{md,yml,json,yaml,toml,csv}",
    "./app.vue",
  ],

  darkMode: "class",
  theme: {
    extend: {
      fontFamily: {
        author: ["Fasthand"],
        auote: ["Roboto Condensed"],
        hueman:["Montserrat"],
      },
    },
  },
  colors:{
    
  }
};

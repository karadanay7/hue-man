// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled: true },
  modules: ["@nuxt/ui", "@nuxtjs/supabase", "@nuxt/image"],
  css: ['~/assets/style.css'],
  ui: {
    global: true,
  },
  supabase: {
    redirect: false,
  },
  colorMode:{
    preference:"dark",
  }

});
<template>
  <div class="relative h-screen overflow-hidden bg-black">
    <!-- Use iframe as background -->
    <div v-if="isDark">
      <iframe src='https://my.spline.design/textfromballoonswithinteractiveanimationcopy-7769282a30249f0b4591d5adb13fa2a3/' frameborder='0' width='100%' height='100%' class="absolute inset-0 z-0"></iframe>
    </div>
    <div v-else>
      <iframe src='https://my.spline.design/textfromballoonswithinteractiveanimation-ea59c5e342fc8e6e9c374958ae4efc5e/'
        frameborder='0' width='100%' height='100%' class="absolute inset-0 z-0"></iframe>
    </div>

    <!-- Content overlaying the iframe -->
    <div class="fixed bottom-0 items-center left-1/2 -translate-x-1/2 z-10 mb-10">
     
      
        <UButton color="white" size="xl">
          <ULink to="/signup">Sign Up Now!</ULink>
        </UButton>
      
    </div>
  </div>
</template>

<script setup lang="ts">


const colorMode = useColorMode();
const isDark = computed({
  get() {
    return colorMode.value === 'dark';
  },
  set() {
    colorMode.preference = colorMode.value === 'dark' ? 'light' : 'dark';
  },
});
</script>

<style scoped>
/* Optional: Adjust styles as needed */
</style>

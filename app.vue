<template>
  <div class="bg-[url('/bg.jpg')] dark:bg-[url('/darkbg.jpg')] bg-fixed bg-cover min-h-screen w-full flex flex-col">
    <!-- Header Component -->
    <div class="z-10">
      <Header />
    </div>
    <!-- Main Content Area -->
    <div class="flex-grow ">
      <NuxtPage />
    </div>
    <!-- Notifications -->
    <UNotifications />
  </div>
</template>

<style scoped>
/* Ensuring that the background covers the whole viewport and is fixed */

</style>

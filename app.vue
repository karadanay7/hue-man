<template>
  <div class="bg-[url('/bg.jpg')] dark:bg-[url('/darkbg.jpg')] bg-fixed bg-cover min-h-screen w-full flex flex-col">
    <!-- Header Component -->
    <div>
      <Header />
    </div>
    <!-- Main Content Area -->
    <div class="flex-grow py-4">
      <NuxtPage />
    </div>
    <!-- Notifications -->
    <UNotifications />
  </div>
</template>

<style scoped>
/* Ensuring that the background covers the whole viewport and is fixed */
.bg-fixed {
  background-attachment: fixed;
  background-size: cover;
  background-repeat: no-repeat;
}
</style>

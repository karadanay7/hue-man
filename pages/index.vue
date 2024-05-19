<template>
  <div class="text-gray-800 dark:text-gray-200 h-screen flex flex-col justify-around items-center">
    <!-- Hue-Man component -->
    <Hue-Man />

    <!-- Rise, Reflect, Inspire text -->
    <div class="text-primary-800 dark:text-gray-200">
      <h2 class="text-center text-3xl md:text-4xl font-author tracking-wide font-semibold pt-10">"Rise, Reflect, Inspire"</h2>
    </div>

    <!-- Start Your Journey section -->
    <div class="flex flex-col items-center justify-center gap-2">
      <h1 class="text-2xl md:text-4xl font-bold">Start Your Journey Today!</h1>
      <UButton color="white" size="lg">
        <ULink to="/signup">Sign Up Now!</ULink>
      </UButton>
    </div>
  </div>

  <!-- Section for HomeCarousel component -->
  <div class="h-screen">
    <HomeCarousel />
  </div>
</template>


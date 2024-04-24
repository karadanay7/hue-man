<template>
  <div class="text-gray-600 dark:text-gray-200">
    <Welcome />
    <UContainer>
      <div class="flex flex-col items-center gap-10">
        <!-- Description of -->
        <div
          class="flex flex-col w-full md:w-3/4 self-start text-sm md:text-md gap-2"
        >
          <h1 class="text-lg md:text-2xl">Stay Inspired, Stay Motivated!</h1>
          <p class="text-md">
            Hue-man is your personal companion on the journey towards achieving
            your goals and aspirations. Whether you're striving for academic
            success, aiming to lead a healthier lifestyle, or seeking personal
            growth, we're here to support you every step of the way.
          </p>
        </div>
<HomeCarousel/>
        <div class=" flex flex-col h-44  w-full carousel items-center justify-center gap-2">
<h1 class="text-2xl md:text-4xl font-bold tracking-wider bg-white dark:bg-gray-900">Start Your Journey Today!</h1>
<UButton color="white" size="lg">
  <ULink to="/signup">Sign Up Now!</ULink>
</UButton>
        </div>
      </div>
    </UContainer>
  </div>
</template>

<style>
.carousel {
  background-image: url(/triangles.png);
  
}
</style>

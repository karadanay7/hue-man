<template>
    <div>  <UCarousel
          ref="carouselRef"
          v-slot="{ item }"
          :items="items"
          :ui="{ item: 'w-full' }"
    
          indicators
        >
        <div       class="overflow-hidden w-3/4 md:w-1/2 text-center mx-auto p-2 flex flex-col items-center justify-center dark:bg-gray-900 ">
          <div>
            <h1 class="text-center text-lg">{{ item.header }}</h1>
          </div>

          <div class="flex items-center justify-center pt-4">
            <img
              :src="item.img"
              alt="features"
              class="rounded-full h-36 w-36"
            />
          </div>
          <div class="text-center py-8">
            <p>{{ item.description }}</p>
          </div>
        </div>
         
        </UCarousel></div>
    
</template>
<script setup lang="ts">
const items = [
  {
    header: "Motivational Categories",
    description:
      "Choose variety of categories tailored to your goals, including education, fitness, reading, and more.",
    img: "/1.png",
  },
  {
    header: "Phases of Progress",
    description:
      " Break down your journey into manageable phases, with daily reminders and weekly reflections to keep you on track.",
    img: "/2.png",
  },
  {
    header: "Daily Quotes",
    description:
      "Receive daily doses of inspiration with our handpicked collection of motivational quotes delivered straight to your device.",
    img: "/3.png",
  },
  {
    header: "Track Your Progress",
    description:
      "Visualize your progress over time, celebrate your achievements, and stay motivated to reach new heights.",
    img: "4.png",
  },
];
const carouselRef = ref();
onMounted(() => {
  setInterval(() => {
    if (!carouselRef.value) return;

    if (carouselRef.value.page === carouselRef.value.pages) {
      return carouselRef.value.select(0);
    }

    carouselRef.value.next();
  }, 5000);
});
</script>
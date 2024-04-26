<template>
  <div class="bg-[url('/bg.jpg')] dark:bg-[url('/darkbg.jpg')] min-h-screen ">
    <Header />
    <div
      class="text-gray-800 h-[calc(100vh_-_64px)] flex  flex-col  dark:text-gray-200  items-center justify-around "
    >
   
        <!-- Description of -->
        <div class="mx-auto pt-20 text-primary-800 dark:text-gray-200">
          <h1 class="text-5xl md:text-8xl font-mono text-center ">HUE-MAN</h1>
          <H2 class="text-center text-3xl md:text-4xl">Unlock Your Limits!</H2>
        </div>
        <div><HomeCarousel /></div>
        <div
          class="flex flex-col h-44 w-full carousel items-center justify-center gap-2"
        >
          <h1 class="text-2xl md:text-4xl font-bold tracking">
            Start Your Journey Today!
          </h1>
          <UButton color="white" size="lg">
            <ULink to="/signup">Sign Up Now!</ULink>
          </UButton>
        </div>
      </div>
    </div>

</template>

<style></style>

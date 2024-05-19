<template>
  <div class="">
   
    <div
      class="text-gray-800 h-screen flex  flex-col  dark:text-gray-200  items-center justify-around "
    >
   <Hue-Man/>
        <!-- Description of -->
        <div class="mx-auto pt-20 text-primary-800 dark:text-gray-200">

          <h2 class="text-center text-3xl md:text-4xl font-author tracking-wide font-semibold">"Rise, Reflect, Inspire"</h2>
        </div>

        <div
          class="flex flex-col h-44 w-full carousel items-center justify-center gap-2"
        >
          <h1 class="text-2xl md:text-4xl font-bold ">
            Start Your Journey Today!
          </h1>
          <UButton color="white" size="lg">
            <ULink to="/signup">Sign Up Now!</ULink>
          </UButton>
        </div>
             
      </div>
      <div class="h-screen">

        <div class=""><HomeCarousel /></div>
      </div>
        
    </div>

</template>



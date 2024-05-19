<template >

  <div  class="bg-[url('/bg.jpg')] dark:bg-[url('/darkbg.jpg')] min-h-screen bg-fixed w-full  flex  "> 
    <div  class="">
      <Header/>
    </div>
   <div class="flex-grow py-4" >
    <NuxtPage  />
   </div>
   
   

  <UNotifications />
  </div>
</template>


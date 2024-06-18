<template>
  <div
    class="mx-auto px-2 h-screen fixed   flex items-starts justify-between  bg-transparent lg:pl-8">
    <!-- Vertical navbar -->
    <div class="flex flex-col gap-3 ">
      <!-- Logo -->
      <div class="my-4 flex justify-center items-center lg:justify-start">
        <ULink to="/">
          <NuxtImg src="/logo.png" alt="Logo" format="webp" class="h-6 hidden lg:block" sizes="sm:100vw md:100vw lg:400px" />
          <NuxtImg src="/logosm.png" alt="Logo" format="webp" class="h-10 block lg:hidden" sizes="sm:100vw md:100vw lg:400px" />
        </ULink>
      </div>

      <!-- Navigation links -->
      <div class="flex flex-col w-full  text-gray-600 dark:text-gray-100  ">
        
        <ul class="text-xl font-semibold items-center lg:items-start flex flex-col gap-2">
          <li class=" flex items-center  gap-2 py-2  ">
            <UToggle v-model="isDark" on-icon="i-heroicons-moon" off-icon="i-heroicons-sun" size="lg" class="mt-4" />
          </li>
          <li v-for="navItem in navItems" :key="navItem.id" class="flex items-center gap-2 py-2 rounded-full hover:bg-gray-300 hover:bg-opacity-60 hover:scale-110 transition-transform duration-300 ease-in-out">
            <Icon :name="navItem.icon" size="30" />
            <NuxtLink :to="navItem.to" class="hidden lg:block">{{ navItem.label }} 	&nbsp;	&nbsp; </NuxtLink>
          </li>
        </ul>
    
      </div>

      <!-- Sign-in/out and theme toggle -->
      <div class="mt-auto flex flex-col gap-2">
        <button v-if="user" @click="pushProfile" class="flex items-center justify-start gap-2 bg-primary dark:bg-green-600 p-2 rounded-full hover:scale-110 border-2 border-hidden dark:border-white border-gray-600 hover:border-solid">
          <div>
            <img class="h-8 w-8 rounded-full" src="https://static.vecteezy.com/system/resources/previews/002/002/257/non_2x/beautiful-woman-avatar-character-icon-free-vector.jpg" alt="">
          </div>
          <div class="text-xl font-semibold text-gray-600 dark:text-gray-100 hidden lg:block">Profile</div>
        </button>
        <button v-if="!user" @click="navigateAuth" class="flex items-center justify-start gap-2 bg-primary dark:bg-green-600 p-2 rounded-full hover:scale-110 border-2 border-hidden dark:border-white border-gray-600 hover:border-solid">
          <div>
            <Icon name="material-symbols:login" size="20"/>
          </div>
          <div class="text-xl font-semibold text-gray-600 dark:text-gray-100 hidden lg:block">Login</div>
        </button>
        <button v-else @click="signOut" class="flex items-center justify-center lg:justify-start gap-2 bg-primary dark:bg-green-600 p-2 rounded-full hover:scale-110 border-2 border-hidden dark:border-white border-gray-600 hover:border-solid">
          <div>
            <Icon name="material-symbols:logout" size="20" />
          </div>
          <p class="text-xl font-semibold text-gray-600 dark:text-gray-100 hidden lg:block">Sign out</p>
        </button>
       

       

      </div>
    </div>

  </div>
</template>
<script setup>
const supabase = useSupabaseClient();
const user = useSupabaseUser();

const signOut = () => {
  supabase.auth.signOut();

  return navigateTo("/");
};
const navigateAuth = () => {
  return navigateTo("/login");
};
const pushProfile= () => {
  return navigateTo("/profile");
};

const colorMode = useColorMode();
const isDark = computed({
  get() {
    return colorMode.value === "dark";
  },
  set() {
    colorMode.preference = colorMode.value === "dark" ? "light" : "dark";
  },
});
const navItems = [
  { id: 1, icon: "i-heroicons-home", to: "/", label: "Home" },
  { id: 2, icon: "i-heroicons-globe-europe-africa-solid", to: "/community", label: "Community" },
  { id: 3, icon: "i-heroicons-light-bulb", to: "/quotes", label: "Quotes" },
  { id: 4, icon: "i-heroicons-book-open", to: "/freeplace", label: "Free-Place" }
];

</script>

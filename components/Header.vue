<template>
  <div
    class="mx-auto px-4 h-screen fixed   flex items-starts justify-between border-b border-gray-200 dark:border-gray-600 bg-transparent">
    <!-- Vertical navbar -->
    <div class="flex flex-col gap-3 p-2">
      <!-- Logo -->
      <div class="my-4">
        <ULink to="/">
          <NuxtImg src="/logo.png" alt="Logo" format="webp" class="h-6" sizes="sm:100vw md:100vw lg:400px" />
        </ULink>
      </div>

      <!-- Navigation links -->
      <div class="flex flex-col w-full  text-gray-600 dark:text-gray-100  ">
        
        <ul class="text-xl font-semibold items-start flex flex-col gap-2">
          <li class=" flex items-center  gap-2 p-2  ">
            <UToggle v-model="isDark" on-icon="i-heroicons-moon" off-icon="i-heroicons-sun" size="lg" class="mt-4" />
          </li>
          <li v-for="navItem in navItems" :key="navItem.id" class="flex items-center gap-2 p-2 rounded-full hover:bg-gray-300 hover:bg-opacity-60 hover:scale-110 transition-transform duration-300 ease-in-out">
            <Icon :name="navItem.icon" size="30" />
            <NuxtLink :to="navItem.to">{{ navItem.label }}</NuxtLink>
          </li>
        </ul>
    
      </div>

      <!-- Sign-in/out and theme toggle -->
      <div class="mt-auto">
        <ULink v-if="!user" @click="navigateAuth" class="text-sm hover:text-primary" size="xs">
          <UIcon name="i-heroicons-arrow-right-end-on-rectangle-20-solid" />
          Login
        </ULink>

        <ULink v-if="user" @click="signOut()" class="text-sm hover:text-primary" size="xs">
          <UIcon name="i-heroicons-arrow-right-end-on-rectangle-20-solid" />
          Sign out
        </ULink>

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

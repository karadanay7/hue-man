<template>
    <UContainer
      class="mx-auto px-4 h-16 sm:px-6 lg:px-8 max-w-7xl flex items-center justify-between border-b border-gray-200 dark:border-gray-600 gap-3 bg-transparent "
    >
      <div class="lg:flex-1 flex items-center ">
        <ULink to="/">
          <NuxtImg
            src="/logo.png"
            alt="Logo"
            format="webp"
            class="h-6"
            sizes="sm:100vw md:100vw lg:400px"
          />
        </ULink>
      </div>
   
  
      <div class="hidden lg:flex  items-center gap-x-8 gap-1.5">
        <UHorizontalNavigation :links="horizontalLinks" />
      </div>
  
      <div
        v-if="isMenuOpen"
        class="flex flex-col lg:hidden top-16 absolute z-10 mx-auto left-0 right-0 border  text-start  border-gray-300 dark:border-gray-600 justify-center py-2 items-center"
      >
        <div class="absolute top-0 w-full flex justify-end items-center">
          <NuxtLink
            v-if="user"
            @click="signOut()"
            size="xs"
            class="flex items-center w-full justify-end gap-1.5 text-sm text-primary p-2"
          >
            <Icon
              name="i-heroicons-arrow-right-start-on-rectangle-20-solid"
              class="text-primary"
            />
            Sign out
          </NuxtLink>
          <NuxtLink
            v-if="!user"
            @click="navigateAuth"
            size="xs"
            class="flex w-full items-center justify-end gap-1.5 text-sm text-primary p-2"
          >
            <Icon
              name="i-heroicons-arrow-right-start-on-rectangle-20-solid"
              class="text-primary"
            />
            Log in
          </NuxtLink>
        </div>
  
        <UVerticalNavigation :links="verticalLinks" />
      </div>
  
      <div class="flex items-center justify-end gap-1.5 lg:flex-1">
   
        <ULink
          v-if="!user"
          @click="navigateAuth"
          class="w-24 hidden lg:flex items-center justify-center gap-1 text-sm hover:text-primary"
          size="xs"
          ><UIcon
            name="i-heroicons-arrow-right-end-on-rectangle-20-solid"
          />Login</ULink
        >
  
        <ULink
          class="hidden md:flex w-24 items-center justify-center gap-1 text-sm hover:text-primary"
          v-else
          @click="signOut()"
          size="xs"
        >
          <Icon name="i-heroicons-arrow-right-start-on-rectangle-20-solid" />
          Sign out
        </ULink>
        <UToggle
          v-model="isDark"
          on-icon="i-heroicons-moon"
          off-icon="i-heroicons-sun"
          size="md"
        />
        <div class="py-2 lg:hidden">
  
  <Icon
  @click="toggleMenu()"
    :name="isMenuOpen ? 'pajamas:close' : 'pajamas:hamburger'"
    class="w-4 h-4  "
  />

</div>
      </div>
    </UContainer>

  </template>
  <script setup lang="ts">
  const supabase = useSupabaseClient();
  const user = useSupabaseUser();
  const isMenuOpen = ref(false);
  const toggleMenu = () => (isMenuOpen.value = !isMenuOpen.value);
  
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
  const horizontalLinks = [
    [
    {
        label: "Home",
        icon: "i-heroicons-home",
        to: "/",
      },
      {
        label: "Community",
        icon: "i-heroicons-globe-europe-africa-solid",
        to: "/community",
      },
      {
        label: "Quotes",
        icon: "i-heroicons-light-bulb",
        to: "/quotes",
      },
      {
        label: "Free-Place",
        icon: "i-heroicons-book-open",
        to: "/freeplace",
      },
   
    ],
  ];
  const verticalLinks = [
    [
    {
        label: "Home",
        icon: "i-heroicons-home",
        to: "/",
      },
      {
        label: "Community",
        icon: "i-heroicons-globe-europe-africa-solid",
        to: "/community",
      },
      {
        label: "Quotes",
        icon: "i-heroicons-light-bulb",
        to: "/quotes",
      },
      {
        label: "Free-Place",
        icon: "i-heroicons-book-open",
        to: "/freeplace",
      },
      
    ],
  ];
  </script>
  
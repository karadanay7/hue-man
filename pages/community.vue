<template>
  <div class="bg-[url('/bg.jpg')] dark:bg-[url('/darkbg.jpg')] min-h-screen">
    <Header />
    <UContainer class=" flex flex-col items-center justify-center">
      <div class="p-4 w-full md:w-1/2">
        <div v-if="user">
          <div class="flex items-center gap-2">
            <div>
              <img
                :src="userImage"
                alt="userProfile"
                class="w-14 rounded-full"
              />
            </div>
            <div class="w-full">
              <UTextarea
                color="primary"
                variant="outline"
                placeholder="Share with community..."
              />
            </div>
            <div>
                <UButton>Post</UButton>
            </div>
          </div>
        </div>
      </div>
    </UContainer>
  </div>
</template>

<script setup>
const user = useSupabaseUser();
const userImage = user.value.user_metadata.avatar_url;
</script>

<style></style>

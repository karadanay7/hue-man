<script setup lang="ts">


// States to manage the visibility of the habit and target modals
const isHabitModalOpen = ref(false);
const isTargetModalOpen = ref(false);
const selectedType = ref<'habit' | 'target' | null>(null);

// Functions to toggle the modals
const toggleHabitModal = () => {
    isHabitModalOpen.value = !isHabitModalOpen.value;
    selectedType.value = 'habit';
};

const toggleTargetModal = () => {
    isTargetModalOpen.value = !isTargetModalOpen.value;
    selectedType.value = 'target';
};

// Function to reset form
const resetForm = () => {
    selectedType.value = null;
};
</script>

<template>
    <div class="flex items-center justify-center h-screen">
    <UContainer class="py-8">
        <div class="flex flex-col items-center justify-center gap-3 pl-10">
            <div class="w-full lg:w-2/3">
                <!-- Page Title -->
                <h1 class="text-3xl font-bold text-center mb-6">Choose Your Focus</h1>

                <!-- Description -->
                <p class="text-center mb-8">
                    Select whether you want to create a new habit or set a target for yourself.
                    Habits are consistent actions you perform regularly, while targets are specific goals
                    you aim to achieve.
                </p>

                <!-- Selection Buttons -->
                <div class="flex justify-around mb-8">
                    <!-- Habit Button -->
                    <UButton
                        label="Set a Habit"
                        @click="toggleHabitModal"
                       
                    />

                    <!-- Target Button -->
                    <UButton
                        label="Set a Target"
                        @click="toggleTargetModal"
                       
                    />
                </div>

                <!-- Modal for Habit Selection -->
                <UModal v-model="isHabitModalOpen" @close="resetForm">
                    <div class="p-8  rounded-lg shadow-xl">
                        <h2 class="text-2xl font-semibold mb-4">Create a New Habit</h2>
                        <p class="mb-4">
                            Define a new habit you want to establish in your daily routine.
                        </p>

                        <!-- Input fields for habit -->
                        <div>
                            <UInput
                                label="Habit Description"
                                placeholder="e.g., Drink 8 glasses of water"
                                class="mb-4"
                            />
                            <UInput
                                type="number"
                                label="Frequency (per day/week)"
                                placeholder="e.g., 7 days/week"
                                class="mb-4"
                            />
                        </div>

                        <!-- Action Buttons -->
                        <div class="flex justify-end space-x-4">
                            <UButton
                                label="Cancel"
                                @click="toggleHabitModal"
                                class="bg-gray-300 hover:bg-gray-400 text-black"
                            />
                            <UButton label="Save"  />
                        </div>
                    </div>
                </UModal>

                <!-- Modal for Target Selection -->
                <UModal v-model="isTargetModalOpen" @close="resetForm">
                    <div class="p-8  rounded-lg shadow-xl">
                        <h2 class="text-2xl font-semibold mb-4">Set a New Target</h2>
                        <p class="mb-4">
                            Set a specific goal you aim to achieve in the near future.
                        </p>

                        <!-- Input fields for target -->
                        <div>
                            <UInput
                                label="Target Description"
                                placeholder="e.g., Lose 10 pounds"
                                class="mb-4"
                            />
                            <UInput
                                type="date"
                                label="Deadline"
                                class="mb-4"
                            />
                        </div>

                        <!-- Action Buttons -->
                        <div class="flex justify-end space-x-4">
                            <UButton
                                label="Cancel"
                                @click="toggleTargetModal"
                              
                            />
                            <UButton label="Save"  />
                        </div>
                    </div>
                </UModal>
            </div>
        </div>
    </UContainer>
</div>
</template>


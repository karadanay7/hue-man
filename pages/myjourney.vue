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
                                    v-model="habitDescription"
                                    label="Habit Description"
                                    placeholder="e.g., Drink 8 glasses of water"
                                    class="mb-4"
                                />
                                <UInput
                                    v-model="habitGoal"
                                    type="number"
                                    label="Goal"
                                    placeholder="e.g., 10"
                                    class="mb-4"
                                />
                                <UInput
                                    v-model="habitCheckpoints"
                                    label="Checkpoints"
                                    placeholder="e.g., Monday, Wednesday"
                                    class="mb-4"
                                />
                            </div>

                            <!-- Action Buttons -->
                            <div class="flex justify-end space-x-4">
                                <UButton
                                    label="Cancel"
                                    @click="resetForm"
                                    class="bg-gray-300 hover:bg-gray-400 text-black"
                                />
                                <UButton label="Save" @click="saveHabit" />
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
                                    v-model="targetDescription"
                                    label="Target Description"
                                    placeholder="e.g., Lose 10 pounds"
                                    class="mb-4"
                                />
                                <UInput
                                    v-model="targetDeadline"
                                    type="date"
                                    label="Deadline"
                                    class="mb-4"
                                />
                                <UInput
                                    v-model="targetCheckpoints"
                                    label="Checkpoints"
                                    placeholder="e.g., End of Week 1, End of Week 2"
                                    class="mb-4"
                                />
                            </div>

                            <!-- Action Buttons -->
                            <div class="flex justify-end space-x-4">
                                <UButton
                                    label="Cancel"
                                    @click="resetForm"
                                    class="bg-gray-300 hover:bg-gray-400 text-black"
                                />
                                <UButton label="Save" @click="saveTarget" />
                            </div>
                        </div>
                    </UModal>
                </div>
            </div>
        </UContainer>
    </div>
</template>


<script setup lang="ts">

const user = useSupabaseUser();
const toast = useToast();
const userId = computed(() => user.value?.id);
const isLoading = ref(false);

const habitDescription = ref('');
const habitGoal = ref(0);
const habitCheckpoints = ref<string[]>([]);
const targetDescription = ref('');
const targetDeadline = ref('');
const targetCheckpoints = ref<string[]>([]);



// Function to save habit
const saveHabit = async () => {
    const requestBody = {
        userId: userId.value,
        description: habitDescription.value,
        goal: habitGoal.value,
        checkpoints: habitCheckpoints.value,
    };

    try {
        const response = await fetch("/api/prisma/add-habit", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(requestBody),
        });

        if (response.ok) {
            AddPostSuccesfulToast(); // Show success toast
            resetForm(); // Close modal and reset form fields
        } else {
            console.error('Failed to save habit:', response.statusText);
            toast.error('Failed to save habit. Please try again.'); // Show error toast
        }
    } catch (error) {
        console.error('Failed to save habit:', error);
        toast.error('Failed to save habit. Please try again.'); // Show error toast
    }
};

// Function to save target
const saveTarget = async () => {
    const requestBody = {
        userId: userId.value,
        description: targetDescription.value,
        deadline: targetDeadline.value,
        checkpoints: targetCheckpoints.value,
    };

    try {
        const response = await fetch("/api/prisma/add-target", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(requestBody),
        });

        if (response.ok) {
            AddPostSuccesfulToast(); // Show success toast
            resetForm(); // Close modal and reset form fields
        } else {
            console.error('Failed to save target:', response.statusText);
            toast.error('Failed to save target. Please try again.'); // Show error toast
        }
    } catch (error) {
        console.error('Failed to save target:', error);
        toast.error('Failed to save target. Please try again.'); // Show error toast
    }
};

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

// Function to reset form and close modals
const resetForm = () => {
    isHabitModalOpen.value = false;
    isTargetModalOpen.value = false;
    selectedType.value = null;
    habitDescription.value = '';
    habitGoal.value = 0;
    habitCheckpoints.value = [];
    targetDescription.value = '';
    targetDeadline.value = '';
    targetCheckpoints.value = [];
};


</script>

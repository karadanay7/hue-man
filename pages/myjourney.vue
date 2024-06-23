<template>
    <div class="flex items-center justify-center h-screen">
        <UContainer class="py-8">
            <div class="flex flex-col items-center justify-center gap-3 pl-10">
                <div class="w-full lg:w-2/3">
                    <h1 class="text-4xl font-bold text-center mb-6 ">Choose Your Focus</h1>
                    <p class="text-center mb-8">
                        Select whether you want to create a new habit or set a target for yourself.
                        Habits are consistent actions you perform regularly, while targets are specific goals
                        you aim to achieve.
                    </p>
                    <div class="flex justify-around mb-8">
                        <UButton
                            label="Set a Habit"
                            @click="toggleHabitModal"
                        />
                        <UButton
                            label="Set a Target"
                            @click="toggleTargetModal"
                        />
                    </div>
                    <UModal v-model="isHabitModalOpen" @close="resetForm">
                        <div class="p-8  rounded-lg shadow-xl ">
                            <h2 class="text-2xl font-semibold mb-4">Create a New Habit</h2>
                            <p class="mb-4">Define a new habit you want to establish in your daily routine.</p>
                            <div>
                                <p>Habit Description:</p>
                                <UInput
                                    v-model="habitDescription"
                                    label="Habit Description"
                                    placeholder="e.g., Drink 8 glasses of water everyday"
                                    class="mb-4"
                                />
                                <p>Habit Goal:</p>
                                <UInput
                                    v-model="habitGoal"
                                    type="text"
                                    label="Goal"
                                    placeholder="e.g., Drink Water"
                                    class="mb-4"
                                />
                                <p>Habit Checkpoints:</p>
                            
                                <USelect v-if="habitFrequency=='Daily'"
                                    v-model="habitCheckpoints"
                                    label="Checkpoints"
                              
                                    placeholder="Select checkpoints"
                                    class="mb-4"
                                />
                                <div v-if="habitFrequency=='Daily'">
                                    <USelect
                                    v-model="habitCheckpoints.hours"
                                    />
                                </div>
                                   
                            
                            </div>
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
                    <UModal v-model="isTargetModalOpen" @close="resetForm">
                        <div class="p-8  rounded-lg shadow-xl">
                            <h2 class="text-2xl font-semibold mb-4">Set a New Target</h2>
                            <p class="mb-4">Set a specific goal you aim to achieve in the near future.</p>
                            <div>
                                <UInput
                                    v-model="targetDescription"
                                    label="Target Description"
                                    placeholder="e.g., Lose 10 pounds"
                                    class="mb-4"
                                />
                                <p>Target Deadline:</p>
                                
                                <UInput
                                    v-model="targetDeadline"
                                    type="date"
                                    label="Deadline"
                                    class="mb-4"
                                    placeholder="Target Deadline"
                                />
                                <p>Target Checkpoints:</p>
                                <USelect
                                    v-model="targetFrequency"
                                    label="Frequency"
                                    :options="['Daily', 'Weekly', 'Monthly']"
                                    placeholder="Select frequency"
                                    class="mb-4"
                                />
                              
                            </div>
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
const userId = ref<string | null>(null);

const isHabitModalOpen = ref(false);
const isTargetModalOpen = ref(false);

const habitDescription = ref('');
const habitGoal = ref("");
const habitFrequency = ref('');
const habitCheckpoints = ref<string[]>([]);

const targetDescription = ref('');
const targetDeadline = ref('');
const targetFrequency = ref('');
const targetCheckpoints = ref<string[]>([]);

const toggleHabitModal = () => {
    isHabitModalOpen.value = !isHabitModalOpen.value;
};

const toggleTargetModal = () => {
    isTargetModalOpen.value = !isTargetModalOpen.value;
};

const resetForm = () => {
    isHabitModalOpen.value = false;
    isTargetModalOpen.value = false;
    habitDescription.value = '';
    habitGoal.value = 0;
    habitFrequency.value = '';
    habitCheckpoints.value = [];
    targetDescription.value = '';
    targetDeadline.value = '';
    targetFrequency.value = '';
    targetCheckpoints.value = [];
};

const saveHabit = async () => {
    if (!userId.value || !habitDescription.value || habitGoal.value <= 0 || habitFrequency.value === '' || habitCheckpoints.value.length === 0) {
        toast.error('Please fill all fields correctly.');
        return;
    }

    const requestBody = {
        userId: userId.value,
        description: habitDescription.value,
        goal: habitGoal.value,
        frequency: habitFrequency.value,
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
            toast.success('Habit saved successfully!');
            resetForm();
        } else {
            console.error('Failed to save habit:', response.statusText);
            toast.error('Failed to save habit. Please try again.');
        }
    } catch (error) {
        console.error('Failed to save habit:', error);
        toast.error('Failed to save habit. Please try again.');
    }
};

const saveTarget = async () => {
    if (!userId.value || !targetDescription.value || !targetDeadline.value || targetFrequency.value === '' || targetCheckpoints.value.length === 0) {
        toast.error('Please fill all fields correctly.');
        return;
    }

    const requestBody = {
        userId: userId.value,
        description: targetDescription.value,
        deadline: targetDeadline.value,
        frequency: targetFrequency.value,
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
            toast.success('Target saved successfully!');
            resetForm();
        } else {
            console.error('Failed to save target:', response.statusText);
            toast.error('Failed to save target. Please try again.');
        }
    } catch (error) {
        console.error('Failed to save target:', error);
        toast.error('Failed to save target. Please try again.');
    }
};

</script>

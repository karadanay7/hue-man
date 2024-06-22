<template>
    <div class="flex items-center justify-center h-screen">
        <UContainer class="py-8">
            <div class="flex flex-col items-center justify-center gap-3 pl-10">
                <div class="w-full lg:w-2/3">
                    <h1 class="text-3xl font-bold text-center mb-6">Choose Your Focus</h1>
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
                        <div class="p-8  rounded-lg shadow-xl">
                            <h2 class="text-2xl font-semibold mb-4">Create a New Habit</h2>
                            <p class="mb-4">Define a new habit you want to establish in your daily routine.</p>
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
                                    v-model="habitCheckpointsRaw"
                                    label="Checkpoints"
                                    placeholder="e.g., Monday, Wednesday"
                                    class="mb-4"
                                />
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
                                <UInput
                                    v-model="targetDeadline"
                                    type="date"
                                    label="Deadline"
                                    class="mb-4"
                                />
                                <UInput
                                    v-model="targetCheckpointsRaw"
                                    label="Checkpoints"
                                    placeholder="e.g., End of Week 1, End of Week 2"
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
const userId = computed(() => user.value?.id);

const isHabitModalOpen = ref(false);
const isTargetModalOpen = ref(false);

const habitDescription = ref('');
const habitGoal = ref(0);
const habitCheckpointsRaw = ref('');
const habitCheckpoints = ref<string[]>([]);

const targetDescription = ref('');
const targetDeadline = ref('');
const targetCheckpointsRaw = ref('');
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
    habitCheckpointsRaw.value = '';
    targetDescription.value = '';
    targetDeadline.value = '';
    targetCheckpointsRaw.value = '';
};

const saveHabit = async () => {
    if (!userId.value || !habitDescription.value || habitGoal.value <= 0 || !habitCheckpointsRaw.value) {
        toast.error('Please fill all fields correctly.');
        return;
    }

    habitCheckpoints.value = habitCheckpointsRaw.value.split(',').map(cp => cp.trim());

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
    if (!userId.value || !targetDescription.value || !targetDeadline.value || !targetCheckpointsRaw.value) {
        toast.error('Please fill all fields correctly.');
        return;
    }

    targetCheckpoints.value = targetCheckpointsRaw.value.split(',').map(cp => cp.trim());

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

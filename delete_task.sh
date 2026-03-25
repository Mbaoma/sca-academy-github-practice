#!/bin/bash

TASK_FILE="tasks.txt"

# Check if task file exists
if [ ! -f "$TASK_FILE" ]; then
  echo "Task file not found."
  exit 1
fi

# Ask user for task number
echo "Enter the task number you want to delete:"
read task_number

# Get the task
task=$(sed -n "${task_number}p" "$TASK_FILE")

# Validate task
if [ -z "$task" ]; then
  echo "Invalid task number."
  exit 1
fi

# Show task and ask for confirmation
echo "You are about to delete the following task:"
echo "$task"
echo
read -p "Are you sure you want to delete this task? (yes/no): " confirm

# Confirmation check
if [ "$confirm" = "yes" ]; then
  sed -i "${task_number}d" "$TASK_FILE"
  echo "Task deleted successfully."
else
  echo "Deletion cancelled."
fi
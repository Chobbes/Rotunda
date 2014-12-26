Rotunda Design
==============

Rotunda is a collection of task management software based around the idea of process scheduling. Often the most difficult part of tasks is figuring out when to work on them, and choosing which task to work on. Rotunda aims to ease this process by making the decisions for you.

Schedulers
----------

A variety of different scheduling algorithms may be implemented within Rotunda in order to provide different results. There are several qualities which are desirable in a scheduler.

* Tasks with deadlines should be scheduled more frequently as their deadlines approach.
* Breaks should be scheduled in between periods of work.

Some potential issues that can occur with scheduling:

* A task is swapped out frequently, making it difficult to build up any inertia on the task.
  - A note taking discipline may be helpful for this.
  - Smaller sub-tasks can eliminate this problem.
* If similar, or unwanted tasks are grouped together this can hamper productivity.

Work and Breaks
---------------

How time is split up is extremely important for a task scheduler. It is very important to take plenty of breaks between tasks, otherwise one may become burnt out. By default a work period is 20 minutes, and a break period is 5 minutes between every work period.

Calendar
--------

Rotunda must be able to keep track of all tasks. Thus it must contain built in calendar software.

Git Integration
---------------

All of the tasks are kept track of within a git repository in plain text. This makes it easy to modify them, share your Rotunda calendar, and undo any changes.

Types of Activities
-------------------

Not everything in your calendar requires the same amount of attention.

### Events

Events are normal activities in your calendar. These generally require no additional work, and merely involve you being occupied at a particular time. For instance a doctor's appointment would be an event.

### Tasks

Tasks are events which have a due date. This due date helps with scheduling. A task will be scheduled more frequently as deadlines approach.

### Sub-Tasks

Events and tasks can have other smaller tasks which must be completed before the main task. Rotunda is able to keep track of the dependencies for these sub-tasks and can schedule them accordingly. Ideally these sub-tasks can be completed within one work period.

Directory Structure
-------------------

Rotunda by default uses the following directory structure. It reserves the `~/.rotunda` directory, and uses it to store information such as configuration files, and activities.

Command Line Interface
----------------------

Rotunda has a command line interface called `rta`. Most of the commands are interactive, but can be supplied with more arguments as desired.

### add

Command to add a task / event to the calendar.

### complete / archive

Mark a task as completed.

### delete

Command to remove a calender entry.

### agenda

Print a daily agenda.

### todo

Print current thing to work on.

### calendar

Print a full calendar to see an overview of tasks.

### Others

* Need a way to swap tasks out... Manually reorder them in the scheduler, etc.
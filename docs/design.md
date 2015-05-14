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

If a task is finished early, then there are a couple of options for the scheduler.

1. All future tasks may be re-evaluated, and a new completely different schedule is made
2. Nothing about the other tasks changes, the now empty time slots are filled with tasks from the current pool
3. All future instances of the planned task are changed to break periods

The third option may be problematic, particularly if tasks are scheduled far in advance. The first and second options are preferable.

1. This option gives the algorithm much more flexibility, and can allow for better time usage.
2. This option keeps the calendar of tasks much more stable, which makes them easier to keep track of.

This may be best left to user preference, and some compromise between these three options may be prefered.

### Default Scheduling Algorithm

It should be possible to replace the scheduling algorithm with something else if desired, but Rotunda should supply a good default option. This scheduler is designed to take advantage of as many desirable qualities as possible.

Firstly the scheduler must be able to deal with tasks and events which are restricted to certain time slots. These are assigned first.

### Possible disciplines

* FIFO
  - Will only have one task until the end of time, until it's finished and we move onto the next one.
* EDF
  - Simple. Should work well if deadlines are spread out, but otherwise it may cause issues.
* SRT
  - Need to estimate remaining time.
* RR
  - Unstable :(.


Work and Breaks
---------------

How time is split up is extremely important for a task scheduler. It is very important to take plenty of breaks between tasks, otherwise one may become burnt out. By default a work period is 20 minutes, and a break period is 5 minutes between every work period.

Calendar
--------

Rotunda must be able to keep track of all tasks. Thus it must contain built in calendar software.

* Custom calendar / agenda displays
* ical import / export
* Google calendar integration

Git Integration
---------------

All of the tasks are kept track of within a git repository in plain text. This makes it easy to modify them, share your Rotunda calendar, and undo any changes (which could be particularly useful for accidental calendar imports).

  - It is desirable to let Rotunda have access to multiple git repos for coordinating calendars.
  - Don't necessarily want everybody to have access to your entire calendar, but they could have their own shared repo.

Types of Activities
-------------------

Not everything in your calendar requires the same amount of attention.

### Events

Events are normal activities in your calendar. These generally require no additional work, and merely involve you being occupied at a particular time. For instance a doctor's appointment would be an event.

### Tasks

Tasks are events which have a due date. This due date helps with scheduling. A task will be scheduled more frequently as deadlines approach.

### Task Dependency Graphs / Sub-Tasks

Events and tasks can have other smaller tasks which must be completed before the main task. Rotunda is able to keep track of the dependencies for these sub-tasks and can schedule them accordingly. Ideally these sub-tasks can be completed within one work period.

Tasks will actually be represented with a digraph. Certain tasks may depend upon other tasks. An error should be displayed if there are circular dependencies between tasks.

### Desired Features

It should be possible to record recurring events. These could happen on particular days of the week, and may be given various predetermined time slots. It should also be possible to schedule daily tasks which can be performed within certain time periods (or throughout the entire day), for instance one might wish to schedule "reading" for 30 minutes a day.

Directory Structure
-------------------

Rotunda by default uses the following directory structure. It reserves the `~/.rotunda` directory, and uses it to store information such as configuration files, and activities. Each task, or event entered into Rotunda will be placed in this directory with a name matching the current date and time in ISO 8601 format.

Markup
------

In the future a custom markup language may be developed to ease the process, however Rotunda's current philosophy is to not force any particular markup language. Instead Rotunda relies upon [Pandoc](http://johnmacfarlane.net/pandoc/) to parse metadata from various formats such as [org](http://johnmacfarlane.net/pandoc/), and [markdown](http://daringfireball.net/projects/markdown/). This will allow Rotunda to handle many different formats by default.

Certain file formats may not allow for arbitrary metadata. Rotunda must therefore supply an alternative method for supplying metadata to these files. One possibility is having a second file which is a key-value store of the metadata corresponding to the file.

### Templates

User defined templates for tasks / events. If no template can be found no file is created, and the text editor is opened to a blank buffer. Different templates can be used for different formats.

Command Line Interface
----------------------

Rotunda has a command line interface called `rta`. Most of the commands are interactive, but can be supplied with more arguments as desired.

### add

Command to add a task / event to the calendar.

### list

List all of the current tasks / events.

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

### export

Export calendars and more.

### import

Import calendars.

### Others

* Need a way to swap tasks out... Manually reorder them in the scheduler, etc.

Web Interface
-------------

A web interface for Rotunda is planned. This will be implemented after the command line interface has seen some maturity.

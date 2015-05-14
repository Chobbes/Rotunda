{- Copyright (C) 2014 Calvin Beck

   Permission is hereby granted, free of charge, to any person
   obtaining a copy of this software and associated documentation files
   (the "Software"), to deal in the Software without restriction,
   including without limitation the rights to use, copy, modify, merge,
   publish, distribute, sublicense, and/or sell copies of the Software,
   and to permit persons to whom the Software is furnished to do so,
   subject to the following conditions:

   The above copyright notice and this permission notice shall be
   included in all copies or substantial portions of the Software.

   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
   EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
   NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
   BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
   ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
   CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
   SOFTWARE.
-}

module Types where

import System.FilePath
import Data.Text


-- | A Rotunda activity.
data Activity = Event { creationTime :: TimeSpec  -- ^ Time that the event was created.
                      , times :: [TimeSpec] -- ^ Times that this event occurs.
                      , description :: Text  -- ^ Description of the event.
                      , activityFile :: FilePath -- ^ Path to the file.
                      }

              | Task { creationTime :: TimeSpec  -- ^ Time that the task was created.
                     , times :: [TimeSpec] -- ^ Times that this can be worked on.
                     , description :: Text  -- ^ Description of the task.
                     , activityFile :: FilePath -- ^ Path to the file.
                     , dueTimes :: [TimeSpec] -- ^ Times that this task is due.
                     }


-- | Time specification based on cron formats.
data TimeSpec = TimeSpec { minutes :: MinuteSpec
                         , hours :: HourSpec
                         , daysOfMonths :: MonthDaySpec
                         , months :: MonthSpec
                         , daysOfWeeks :: WeekDaySpec
                         , year :: YearSpec
                         }


data MinuteSpec = MinuteSpec [Minutes] | AnyMinutes
data Minutes = Minutes Integer | MinuteRange Integer Integer


data HourSpec = HourSpec [Hours] | AnyHours
data Hours = Hours Integer | HourRange Integer Integer


data MonthDaySpec = MonthDaySpec [MonthDay] | AnyMonthDay
data MonthDay = MonthDay Integer | MonthDayRange Integer Integer


data MonthSpec = MonthSpec [Months] | AnyMonths
data Months = Months Integer | MonthRange Integer Integer


data YearSpec = YearSpec [Years] | AnyYears
data Years = Years Integer | YearRange Integer Integer


data WeekDaySpec = WeekDays [WeekDay] | AnyWeekDay
data WeekDay = Monday
             | Tuesday 
             | Wednesday
             | Thursday
             | Friday
             | Saturday
             | Sunday


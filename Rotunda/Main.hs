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

import Data.List
import Data.Time
import System.Directory
import System.Environment
import System.FilePath
import System.Process


-- | Rotunda's command line interface.
main :: IO ()
main = 
  do args <- getArgs
     case args of
       ["add"] -> addTask
       _ -> error "Invalid command line arguments."


-- | Add a task to the repository.
addTask :: IO ()
addTask = 
  do editor <- getEditor
     currentDir <- getCurrentDir
     time <- getCurrentTime

     let taskFile = joinPath [currentDir, toFileName time]

     createDirectoryIfMissing True currentDir
     writeFile taskFile (makeTemplate time)             
  
     callProcess editor [taskFile]
  where toFileName time = addExtension (intercalate "-" (words (show time))) "md"


-- | Fetch the user's editor given the $EDITOR environment variable.
getEditor :: IO String
getEditor = do env <- getEnvironment
               let editor = lookup "EDITOR" env
               return (case editor of
                         Nothing -> error "Please set the $EDITOR variable."
                         Just ed -> ed)


-- | Make a template for a task.
makeTemplate :: UTCTime -> String
makeTemplate time = unlines [ "---"
                            , "title: "
                            , "date: " ++ show time
                            , "due: "
                            , "tags: "
                            , "---"
                            , ""
                            ]


getRotundaDir :: IO FilePath
getRotundaDir = do home <- getHomeDirectory
                   return (joinPath [home, ".rotunda"])


getActivityDir :: IO FilePath
getActivityDir = do rotunda <- getRotundaDir
                    return (joinPath [rotunda, "activities"])


getCurrentDir :: IO FilePath
getCurrentDir = do activity <- getActivityDir
                   return (joinPath [activity, "current"]) 


getArchiveDir :: IO FilePath
getArchiveDir = do activity <- getActivityDir
                   return (joinPath [activity, "archive"]) 

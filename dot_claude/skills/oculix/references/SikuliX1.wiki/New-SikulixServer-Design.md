[This is based on this discussion](https://github.com/RaiMan/SikuliX1/issues/130)

Implementation in branch: `master` since Octobre 26th 2019 (build #423+ / API snaphots)

Be aware: experimental - feedback welcome

## Starting
To start SikulixServer from a command line:  
 `java -jar sikulix.jar -s [ [ip][[:| ]port] ] [-g groups-config] [-x ip-config]`   
(one might also use `sikulixapi.jar`)

The server will always listen on `localhost:port`.

 - `-s` 
   - `-s [ [ip][[:| ]port] ]` listening on ip and port (default is 0.0.0.0 and 50001)
   - `-s file` path to a text file containing more than one IP:port per line   
     file-path either relativ inside the current working folder or absolute
 - `-g groups-config` will be detailed later in [Groups](#groups)
 - `-x ip-config` will be detailed later in [Security](#security)

Valid examples for IP:port:
 - `192.168.10.1 50010` -> 192.168.10.1:50010
 - `192.168.10.1:50010` -> 192.168.10.1:50010
 - `50010` -> 0.0.0.0:50010 (single numeric value)
 - `:50010` -> 0.0.0.0:50010

For IPv6 one has to use one of the two variants:   
( :: here stands for any valid IPv6 address)
 - `:: 50010` -> [0:0:0:0:0:0:0:0]:50010
 - `[::]:50010` -> [0:0:0:0:0:0:0:0]:50010

## Groups
A group represents a folder location or more general a location somewhere in the world.   
Currently only local folders on the server machine are supported.  
SikulixServer only accesses resources located inside a group.

Group configuration is given at SikulixServer startup.  
There are three ways to do this.
* `-g folder-spec` :: sets the default location
* `-g someFile[.txt]` :: contains lines group-name : folderspec, first line defines the default
* `-g someFile.json` :: same as JSON

The default group (default location) is implicitly referenced when `/groups` is omitted in a command. If no default location is given, it is taken as the current working folder.

Folder and file names are interpreted as:
 - absolute as is
 - relativ as inside the current working folder

Accepted entries in the groups text-file:
 - first line may only be a folder spec (default group)
 - group folder
 - group:folder
 - group=folder
 - group and folder might have surrounding spaces
 - group names or folder specs containing spaces are not allowed
 - if the given folder does not exist in the filesystem at server start, the entry is silently ignored

## Commands (RESTful API)
[We are respecting the recommendations from here](https://restfulapi.net/).   
### Scripts

* This command might be preceded by **/groups/:name**. If omitted, the default group is assumed.   
`/groups/:name/scripts/...`

* `/scripts`  
Represents the available scripts in the group.  
`GET` - Return a list of available scripts in the group.  

* `/scripts/:name`  
Represents the named script.  
`GET` - Returns info about the named script.

* `/scripts/:name/run?args=:args`  
**Synchronous execution:** A controller that executes the named script.   
`GET/POST` - Executes the script synchronously and waits for it to finish before returning.   
Creates a new task implicitly as this request is also going to be queued first.

* `/scripts/:name/task?args=:args`  
**Asynchronous execution:** Represents the named script as a task in the queue to be executed later.  
The script execution is queued and the server returns immediately.   
The client is responsible to evaluate the task state later using a [task command](#tasks).   
`POST` - Creates a new task which is queued and returns a task object.  

### Groups
This command can only be used as the first path.
* `/groups`  
Represents the available groups.  
`GET` - Returns a list of available groups.  

* `/groups/:name`  
Represents the named group.  
`GET` - Returns the subtree (folders and contained scripts) in the group.

### Tasks
This command can be preceded by **/scripts/:name** or **/groups/:name/scripts/:name**.   
In that case, only the tasks for that script are referenced.
* `/tasks`  
Represents the tasks (already finished, running, still queued and/or cancelled).  
`GET` - Returns a list of tasks (task objects)  

* `/tasks/:id`  
Represents the task with the ID, which was returned with the task object when created before.  
`GET` - Returns information about the task with the ID. 

* `/tasks/:id/cancel`  
A controller that removes the task with the ID from the queue or stops it gracefully if it is running.   
`PUT` - Cancels/Stops the task with ID. 

### Server Controllers
This command can only be used at the first path.
* `GET/POST /pause`  
Pauses the script execution after the currently running script ends.   
Calls to run after pause should give some 4xx error to indicate that the server is in pause mode.   
Asynchronous runs can still be placed in the task queue.

* `GET/POST /resume`  
Resumes script execution.

* `GET/POST /stop`  
Stops SikulixServer.

## Security
SikulixServer does a source IP checking (Only localhost by default).
 
A list of allowed remote IPs might be given at server startup:   
There are three ways to do this.
* `-x one-IP` :: allow localhost and this given IP
* `-x someFile[.txt]` :: contains IPs one per line, that are allowed request sources
* `-x someFile.json` :: same as JSON

If the user is using a reverse proxy he can just leave this setting on localhost and implement access restrictions there.

File names are interpreted as:
 - absolute as is
 - relativ as inside the current working folder
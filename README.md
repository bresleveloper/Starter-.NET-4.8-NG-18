# Starter-.NET-4.8-NG-18

project is C# WebApi 2.0 upon .NET Framework 4.8 (not core), in integrated angular 18.

implements `SimpleController`, `simpleService` for super quick implementation for controllers and ng-services. read the files to see examples.

to install and use angular material `ng add @angular/material@18` and uncomment the `MaterialModule` content and reference in `Components module`. 



## How to Duplicate 
use `https://www.npmjs.com/package/@bresleveloper/starter`

* `npm i @bresleveloper/starter -g` (currently not working without -g)
* `bresleveloper new <projectName>` (should change everything to your `<ProjectName>`)
* p.s. i added `bresleveloper dup` to clone any git repo


## Usefull short-hand files:
* `cgo.bat` - run c# api server (cant debug)
* `nggo.bat` - run angular serve from root
* `ngb.bat` - run angular build with `--base-href=/dist/` from root
* `rogue.ps1` - find rogue node processes (angular or other), use `rogue.ps1 <pid>` to kill
* `cli.example.bat` - in another project i created working cli, i put here the example TBD make another that is tailored to this template
* `gitme.bat` - full git push with comment

* ##### Remove all bin and obj folders from Git tracking (recursively) on Windows PowerShell:
`Get-ChildItem -Recurse -Directory -Include bin,obj | ForEach-Object { git rm -r --cached $_.FullName }`

* ##### git remove file from cashing:
* `git rm --cached <fullpath>`       => remove a file
* `git rm -r --cached <fullpath>`    => remove a folder


## claude code

### general 
* monitor - `npx ccusage@latest` from terminal
* added `CLAUDE.md` for him to understand the project (`claude -> /init`)
* added agents
* example super simple prompt for agent `angular agent based on CLAUDE.md`
* added [ContextEngineeringRef.md](https://github.com/bresleveloper/Starter-.NET-4.8-NG-18/blob/master/ContextEngineeringRef.md) for some resources about Context Engineering


### claude code commands added

i like to use `tasks` folder to write my tasks for claude. i also like to use is for my logs files. i also like to have `console.log` file to quickly copy browser console for errors. so eventually its my goto file for errors or small prompts/tasks. therefor these 2 were born:


* `l.md` -> `/l` , read tasks/console.log
* `t.md` -> `/t` or `/t taskName`, create `tasks/taskName.md` with useful template



### MCP

follow instuctions in `MCP/mssql-config.md`

module.exports = 
  # Options
  wait: 1000
  intro: true
  action: 'create'
  exit: false
  input: process.stdin
  output: process.stdout
  completer: null
  terminal: !!process.stdout.isTTY
  # Messages
  commands: """
  [c]reate  Create your new project (default).
  [j]ump    Jump to an already answered question.
  [l]aod    Load a saved project definition.
  [q]uit    Cancel the project creation and leave.
  [r]eset   Erase previous answers.
  [s]ave    Write this project definition to a file for later usage.
  [v]iew    View previous answers.

  Press [enter] to start/resume your project creation or choose one of the command above
  """
  intro: """
  Let's create our new Node.js project.
  At any point in time, press [esc] to view the help.
  """
  required: 'This question is required, please answer it.'
  save_where: 'Where would you like to save your project definition?'
  save_successfull: 'Project definition was successfully written'
  enoent: 'This file does not exists'
  yes: 'yes'
  no: 'no'
  # State
  max_index: 0
  index: 0
  # Questions
  questions: [
    name: 'name'
    label: 'Project Name'
    required: true
  ,
    name: 'description'
    label: 'Project Description'
    default: ''
  ,
    name: 'location'
    label: 'Project location'
    default: (answers) -> "./#{answers.name}"
    required: true
  ,
    name: 'git'
    label: 'Is this a git repository'
    type: 'boolean'
    default: true
  ,
    name: 'github'
    label: 'GitHub url'
    if: (answers) -> answers.git
    match: [
      /\w+@github.com:(.*)\/(.*)\.git/
      /\w+:\/\/github.com\/(.*)\/(.*)\.git/
    ]
  ,
    name: 'mkreadme'
    label: 'Create readme file'
    type: 'boolean'
    default: true
  ,
    name: 'mklicense'
    label: 'Create license file'
    type: 'boolean'
    default: true
  ,
    name: 'license'
    label: 'Choose a license or press enter'
    values: ['mit', 'bsd', 'apache']
    default: 'mit'
    if: (answers) -> answers.mklicense
  ,
    name: 'mkchangelog'
    label: 'Create changelog file'
    type: 'boolean'
    default: true
  ,
    name: 'testing'
    label: 'Are you testing your code'
    type: 'boolean'
  ,
    name: 'testtool'
    label: 'Which testing tool are you using?'
    values: ['mocha', 'jasmine-node']
    default: 'mocha'
    if: (answers) -> answers.testing
  ,
    name: 'dependencies'
    label: 'List of dependencies ("name[=version],...")'
  ,
    name: 'devDependencies'
    label: 'List of development dependencies ("name[=version],...")'
  ,
    name: 'optionalDependencies'
    label: 'List of optional dependencies ("name[=version],...")'
  ,
    name: 'coffeescript'
    label: 'Are you planning to use coffescript'
    type: 'boolean'
    default: false
  ]

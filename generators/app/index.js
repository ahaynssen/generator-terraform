'use strict';

const Generator = require('yeoman-generator');

module.exports = class extends Generator {
  constructor(args, opts) {
    super(args, opts);
  }
  writing() {
    this.fs.copy(
      this.templatePath('main.tf'),
      this.destinationPath('main.tf')
    )
    this.fs.copy(
      this.templatePath('outputs.tf'),
      this.destinationPath('outputs.tf')
    )
    this.fs.copy(
      this.templatePath('variables.tf'),
      this.destinationPath('variables.tf')
    )
    this.fs.copy(
        this.templatePath('README.md'),
        this.destinationPath('README.md')
    )
    this.fs.copy(
        this.templatePath('.gitignore'),
        this.destinationPath('.gitignore')
    )
    this.fs.copy(
        this.templatePath('.gitignore'),
        this.destinationPath('.gitignore')
    )
    this.fs.copy(
        this.templatePath('examples'),
        this.destinationPath('examples')
    )
  };
};

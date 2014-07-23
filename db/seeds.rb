# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

items = BacklogItem.create([
		{
			title: "P1.Story_1",
			description: "bla bla",
			estimation: "1",
			parent_id: "7",
			status: "sprint",
			item_type: "story"
		},
		{
			title: "P1.Story_2",
			description: "bla bla",
			estimation: "1",
			parent_id: "1",
			status: "product",
			item_type: "story"
		},
		{
			title: "P1.Story_3",
			description: "bla bla",
			estimation: "1",
			parent_id: "1",
			status: "product",
			item_type: "story"
		},
		{
			title: "P2.Story_1",
			description: "bla bla",
			estimation: "1",
			parent_id: "2",
			status: "product",
			item_type: "story"
		},
		{
			title: "P2.Story_2",
			description: "bla bla",
			estimation: "1",
			parent_id: "2",
			status: "product",
			item_type: "story"
		},
		{
			title: "P2.Story_3",
			description: "bla bla",
			estimation: "1",
			parent_id: "2",
			status: "product",
			item_type: "story"
		},
		{
			title: "Sprint1",
			description: "bla bla",
			estimation: "",
			parent_id: "1",
			status: "active",
			item_type: "sprint",
            info: "{\"start_date\":\"2014/05/02\",\"end_date\":\"2014/05/31\"}"
		},
		{
			title: "Story1. Task1",
			description: "bla bla",
			estimation: "1",
			parent_id: "1",
			status: "todo",
			item_type: "task"
		},
		{
			title: "Story1. Task2",
			description: "bla bla",
			estimation: "1",
			parent_id: "1",
			status: "todo",
			item_type: "task"
		}
   ])
   
buttons = DashButton.create([
	{
		btn_content: "Back",
		btn_type: "back" 
	},
	{
		btn_content: "BackFromTeamEditPage",
		btn_type: "back" 
	},
	{
		btn_content: "Team",
		btn_type: "team" 
	},
	{
		btn_content: "Configure",
		btn_type: "config" 
	},
	{
		btn_content: "Delete",
		btn_type: "delete" 
	},
	{
		btn_content: "Configure",
		btn_type: "config" 
	},
	{
		btn_content: "Delete",
		btn_type: "delete" 
	}])

permissions = Permission.create([
	{
		allowed_for: ["scrum_page", "team_page"],
		denied_for: ["project_page", "team_edit_page"], 
		dash_button_id: 1
	},
	{
		allowed_for: ["team_edit_page"],
		denied_for: ["project_page", "scrum_page", "team_page"], 
		dash_button_id: 2
	},
	{
		allowed_for: ["pm"],
		denied_for: ["project_page", "team_page", "team_edit_page"], 
		dash_button_id: 3
	},
	{
		allowed_for: ["pm"],
		denied_for: ["scrum_page"], 
		dash_button_id: 4
	},
	{
		allowed_for: ["pm"],
		denied_for: ["scrum_page"], 
		dash_button_id: 5
	},
	{
		allowed_for: ["techlead"],
		denied_for: ["project_page", "team_page", "team_edit_page"], 
		dash_button_id: 6
	},
	{
		allowed_for: ["techlead"],
		denied_for: ["project_page", "team_page", "team_edit_page"], 
		dash_button_id: 7
	}])

projects = Project.create([
    {
        title: 'car', 
        description: 'Magazine',
        start: '10.10.10',
        finish: '11.11.11',
        owner: 'A',
        pm: '1'
    },
    {
        title: 'web', 
        description: 'WebApp',
        start: '10.10.10',
        finish: '12.12.12',
        owner: 'B',
        pm: '2'
    },
    {
        title: 'sport', 
        description: 'Training',
        start: '13.13.13',
        finish: '14.14.14',
        owner: 'C',
        pm: '2'
    },
    {
        title: 'TaskManager', 
        description: 'Task Manager SoftServe',
        start: '10.02.14',
        finish: '10.03.14',
        owner: 'B',
        pm: '1'
    }])

users = User.create([
    {
        first_name: 'Enzo', 
        last_name: 'Ferrary',
        email: 'enzoferrary@i.ua',
        password: '12345678',
        password_confirmation: '12345678'
    },
    {
        first_name: 'Name', 
        last_name: 'Surname',
        email: 'surname@mail.ru',
        password: '11111111',
        password_confirmation: '11111111'
    },
    {
        first_name: 'Arnold', 
        last_name: 'Schwarzenegger',
        email: 'arni@i.ua',
        password: '1111',
        password_confirmation: '1111'
    },
    {
        first_name: 'Vova', 
        last_name: 'Levij',
        email: 'sda@i.ua',
        password: '1111',
        password_confirmation: '1111'
    },
    {
        first_name: 'Zora', 
        last_name: 'Pravij',
        email: 'sdaaa@i.ua',
        password: '1111',
        password_confirmation: '1111'
    }])

teams = Team.create([
    {
        title: 'team1', 
        description: 'some',
        project_id: 1
    },
    {
        title: 'team2', 
        description: 'some',
        project_id: 1
    },
    {
        title: 'team3', 
        description: 'some',
        project_id: 2
    },
    {
        title: 'team4', 
        description: 'some',
        project_id: 3
    },
    {
        title: 'team5', 
        description: 'some',
        project_id: 4
    }])

team_member = TeamMember.create([
    {
        user_id: 1,
        team_id: 1,
        role: 'watcher'
        },
    {
        user_id: 1,
        team_id: 2,
        role: 'watcher'
    },
    {
        user_id: 1,
        team_id: 5,
        role: 'watcher'
    },
    {
        user_id: 1,
        team_id: 3,
        role: 'developer'
    },
    {
        user_id: 2,
        team_id: 3,
        role: 'developer'
    },
    {
        user_id: 3,
        team_id: 3,
        role: 'developer'
    },
    {
        user_id: 3,
        team_id: 5,
        role: 'developer'   
    }])


![](https://img.shields.io/badge/Ingemark-blue)

# Job Finder

> This is a job search and a job posting application, through which anyone can apply for a posted job offer, and only logged-in users can create and post new job offers. 

![screenshot](public/Screenshots/Screenshot-joblist.png)
![screenshot](public/Screenshots/Screenshot-job.png)
![screenshot](public/Screenshots/Screenshot-newjob.png)

Additional description about the project and its features.

## Built With

- Ruby v2.7.2
- Ruby on Rails v6.1.4
- Bootstrap 5
- Sass

## Live Demo

[Live Demo Link](https://livedemo.com)


## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

- Docker
- Docker-compose

If you don't have those installed please follow the [Docker](https://www.docker.com/get-started) and [Docker-compose](https://docs.docker.com/compose/install/) installation guide.

### Setup

Clone the repository with:

```
git@github.com:ShinobiWarior/jobfinder.git
```
or download [ZIP file](https://github.com/ShinobiWarior/jobfinder/archive/refs/heads/develop.zip)

### Install

- From the app directory run command: 
```
git checkout development
git pull
```

After that make the images and build containers on Docker. Run the following commands:
```
docker-compose run --no-deps web
```
If you are linux user you may need to run:
```
sudo chown -R $USER:$USER .
```
After that run:
```
docker-compose build
```
You can now boot the app with docker-compose up:
```
docker-compose up
```
Finally, you need to create the database. In another terminal, run:

```
docker-compose run web rake db:create
docker-compose run web rake db:migrate
```
You can use created seeds if you run:
```
docker-compose run web rails db:seed
```

### Usage

Now you can open the app on your browser with adress:
```
http://localhost:3000/
```

### Run tests
If you want to test app, run command:
```
docker-compose run web bundle exec rspec
```


## Author

👤 **ALeksandar Ivezic**

- GitHub: [Aleksandar Ivezic](https://github.com/ShinobiWarior)
- Twitter: [@Aivezic](https://twitter.com/Aivezic)
- LinkedIn: [Aleksandar Ivezic](https://www.linkedin.com/in/aleksandar-ivezic/)



## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Hat tip to anyone whose code was used
- Inspiration
- etc

## 📝 License

This project is [MIT](lic.url) licensed.

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Job.destroy_all
@user = User.create(name: "Ingemark", email: "ingemark@example.com", password: "password" , password_confirmation: "password")

@user.jobs.create!([{
  name: 'Full-Stack developer',
  description: "

  The primary responsibility of a Full Stack Developer  includes designing user interactions on websites, developing servers and databases for website functionality and coding for mobile platforms.
  
  Particular responsibilities often include:
  
  ● Developing front end website architecture.
  ● Designing user interactions on web pages.
  ● Developing back end website applications.
  ● Creating servers and databases for functionality.
  ● Ensuring cross-platform optimization for mobile phones.
  ● Ensuring responsiveness of applications.
  ● Working alongside graphic designers for web design features.
  ● Seeing through a project from conception to finished product.
  ● Designing and developing APIs.
  ● Meeting both technical and consumer needs.
  ● Staying abreast of developments in web applications and programming languages.
  ",
  category: "Web development",
  expiring_date: "14-12-2021"
},
{
  name: 'Senior Hardware Design Engineer',
  description: "

  RESPONSIBILITIES:

    Developing on-board chargers, high voltage DC-DC, high voltage power distribution modules, instrument clusters smart junction boxes,
    body electronics design, fuel senders, quiescent relay boxes, for both passenger cars and trucks;
    Designing, developing and testing the hardware of automotive embedded systems according to customer requirements and
    internal procedures and writing the corresponding documentation of design and testing activities;
    Assisting quality assurance in verifying requirements, design, implementation, and testing;
    Participating in quotation activities for new business;
    Supporting design validation and product validation of the products developed;
    Improving current hardware designs and make optimizations from the cost point of view;
    Managing large and small complete projects by planning and estimating work packages;
    Evaluating for selection or developing test and development tools from your area of expertise;
    Contributing to the development and implementation of standardized design methods and processes.

QUALIFICATIONS:

    Knowledge about electronics: high voltage electronics, power supplies, digital and analog circuits, EMC / EMI norms;
    Knowledge and experience with CAD tools for schematic and layout design (e.g. Mentor Xpedition, OrCAD);
    Strong experience/knowledge in simulation tools (Spice, Simetrix) and worst-case analysis (e.g. MathCAD);
    Knowledge about automotive interfaces (LIN, CAN);
    Previous automotive experience in hardware is an advantage;
    Knowledge of product development lifecycle with regards to the automotive electronics industry would be a plus;
    Basic understanding of related design disciplines and experience with Project management would be a plus;
    Fluent in English.

  ",
  category: "Hardware design",
  expiring_date: "14-12-2021"
},
{
  name: 'Software Engineer 2 in Microsoft Office AI Platform ',
  description: "

  Come join Microsoft Office to work on state-of-the-art services and platforms and deliver next generation of productivity experiences!  

Microsoft Office is a suite of products and experiences used across the globe. At Microsoft Office team in Microsoft Development Center Serbia (MDCS), we have been focusing on reimagining and empowering Microsoft Office productivity through AI-powered user experiences and services built across core Microsoft Office applications. The team is relentlessly focused on making AI and tech work for people! 

We are building the platform for bringing real-time machine learning and AI into Office applications, for assisting tens of millions of users every single day, across all major operating systems and form factors. It comprises of a massive scale service and client components that work together to orchestrate intelligence-based scenarios. This platform is for first- and third-party developers and it is a key component of the overall Office development experience. For example, the platform is currently powering experiences such as: Microsoft Editor, Text Predictions in Word and Outlook, Similarity Checker, Designer in Microsoft Word, Voice Dictation and Commanding.
Responsibilities

We are looking for backend developers who can build the infrastructure on top Office technology stacks to support experiences which will surface on many different canvases. We value modern engineering practices that ensure high quality code - code reviews, requirements, unit testing, TDD, etc; growth mindset in which everyone continuously look to improve problem solving, design, coding and debugging skills; passion, creativity, accountability, and the desire to explore and learn new technologies. 

As part of the team, you will:  

    Build and operate highly-scalable, fault-tolerant, elastic and secure services in Azure cloud 
    Work on technical architecture and delivery of complex projects, interfacing with product, design, and a dozen dependencies  
    Contribute to team-wide fundamentals/infrastructure investments to influence the future roadmap and improve our current offerings 

Qualifications

    2+ years of software development experience in a product group 
    2+ years of experience building microservices/distributed systems and applications 
    Strong ability and effectiveness working in a significant technical problem domain, in the term of plan, design, execution, continuous release and service operation 
    Strong software engineering fundamentals, including coding, problem solving and data analysis skills 
    Experience with one or more general purpose programming languages including, but not limited to: Java, C/C++, C#, Python, JavaScript 
    Familiarity with NodeJS, TypeScript, C/C++ 
    Experience building APIs, SDKs, or other development platform components 
    The ability to multi-task while balancing short-term and long-term tasks. Agility in fast paced environment 
    Strong ability in self-learning, entering new domain, managing through uncertainty in an innovative team environment 
    Strong customer focus and data driven approach 
    Passionate and self-motivated 

Ability to effectively work in collaborative multiple project team environment and ship production features in a fast-paced startup-like environment 

Microsoft is an equal opportunity employer. All qualified applicants will receive consideration for employment without regard to age, ancestry, color, family or medical care leave, gender identity or expression, genetic information, marital status, medical condition, national origin, physical or mental disability, political affiliation, protected veteran status, race, religion, sex (including pregnancy), sexual orientation, or any other characteristic protected by applicable laws, regulations and ordinances. If you need assistance and/or a reasonable accommodation due to a disability during the application or the recruiting process, please send a request via the Accommodation request form.

Benefits/perks listed below may vary depending on the nature of your employment with Microsoft and the country where you work.
Benefits and Perks

    Industry leading healthcare
    Savings and investments
    Giving programs
    Educational resources
    Maternity and paternity leave
    Opportunities to network and connect
    Discounts on products and services
    Generous time away

  ",
  category: "BackEnd",
  expiring_date: "14-12-2021"
}])
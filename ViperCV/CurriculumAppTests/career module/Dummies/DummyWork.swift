//
//  MockWork.swift
//  CurriculumAppTests
//
//  Created by Gonzalo Alfonso on 03/09/2021.
//

import Foundation
@testable import CurriculumApp

// MARK: DummyWork struct
struct DummyWork {
    // MARK: - Properties
    static var dummyWork1: Work = Work(summary: "My first and still only job as a developer. I started learning Swift, iOS architecture designs patterns, and other necessary practices to became an iOS developer. Really learning and enjoying a lot surrounded by great people, a great work enviroment and really great teachers.", company: "Globant", position: "Trainee iOS Mobile Developer", startDate: "2021-07-01", endDate: "-")

    static var dummyWork2: Work = Work(summary: "I'm a music theory proffessor at the Argentinian national program 'Orquestas Escuela' ('School orchestras'). Where I give music lessons to children and teenagers. Great job where I get to know different social realities and make my part on changing some of them.", company: "P.P.O.E.", position: "Music Proffessor", startDate: "2017-07-01", endDate: "-")

    static var dummyWork3: Work = Work(summary: "I spent more than 10 years teaching and making music. I have travelled a lot with different kinds of projects, most of them involving brasilian music (samba, choro, pagode), jazz and latin folklores (Tango, Candombe, Cancion Popular RioPlatense). I've worked as a producer, writing arrangements, recording and mixing", company: "Freelance", position: "Producer", startDate: "2010", endDate: "-")
}

class Room {
  final String name;
  final String? description;
  final List<Faculty>? faculty;

  Room({required this.name, this.description, this.faculty});
}

class Faculty {
  final String name;
  final String designation;

  Faculty({required this.name, required this.designation});
}

class Floor {
  final int number;
  final String floorMapImage;
  final List<Room> rooms;

  Floor({
    required this.number,
    required this.floorMapImage,
    required this.rooms,
  });
}

class Block {
  final String name;
  final List<Floor> floors;

  Block({required this.name, required this.floors});
}

class RoomLocation {
  final String block;
  final int floor;
  final String floorMapImage;
  final String roomName;
  final String? roomDescription;
  final Faculty? matchedFaculty;

  RoomLocation({
    required this.block,
    required this.floor,
    required this.floorMapImage,
    required this.roomName,
    this.roomDescription,
    this.matchedFaculty,
  });
}

List<Block> blocks = [
  Block(
    name: 'IT',
    floors: [
      Floor(
        number: 0,
        floorMapImage: 'assets/images/IT_GROUND_FLOOR.png',
        rooms: [
          Room(name: 'IT-Washroom-0', description: 'Students Washroom'),
          Room(name: 'Gents-Washroom-0', description: 'Staff Washroom'),
          Room(
            name: 'MAC LAB',
            description: 'Department of IT - Mac Center Of Excellence',
          ),
          Room(
            name: 'CYBER SECURITY LAB',
            description:
                'Department of IT - Center Of Excellence - Cyber Security',
          ),
          Room(
            name: 'CL-9',
            description:
                'Computer Lab-9 (CSE)\nPG Computer Lab (CSE)\nDS Lab\nAdvanced Data Structures Lab\nAdvanced Algorithms Lab\nDeep Learing Lab',
          ),
          Room(
            name: 'CL-6',
            description:
                'Centre for Data Analytics\nComputer Lab-6 (CSE)\nOperating Systems & Microprocessor Lab\nMachine Learning Lab',
          ),
          Room(name: 'LIBRARY', description: 'GNITS Library'),
          Room(
            name: 'F004',
            description: 'Staff Room',
            faculty: [
              Faculty(
                name: 'Mrs. J. Mamatha',
                designation: 'Assistant Professor in Management Studies',
              ),
              Faculty(
                name: 'Mrs. E. Pranavi',
                designation: 'Assistant Professor in Management Studies',
              ),
              Faculty(
                name: 'Dr. A. Ramyasri',
                designation: 'Assistant Professor in Management Studies',
              ),
            ],
          ),
          Room(name: 'F003', description: 'Grievance Redressal Cell'),
          Room(
            name: 'F007',
            description: 'Staff Room - GNITS Alumnae Association',
            faculty: [
              Faculty(
                name: 'Dr. B. Venkateshulu',
                designation: 'Dean - Alumni Relations & Higher Education',
              ),
            ],
          ),
          Room(
            name: 'F010',
            description: 'Centre for Student Affairs',
            faculty: [
              Faculty(
                name: 'Dr. P. Aparna',
                designation: 'Dean - Student Affairs',
              ),
            ],
          ),
          Room(
            name: 'F009',
            description: 'Department of Mechanical Engineering',
            faculty: [
              Faculty(
                name: 'M. Venkata Ramana Reddy',
                designation:
                    'Associate Professor, M.Tech(Ph.D)\nHOD - Mechanical Engineering',
              ),
            ],
          ),
        ],
      ),
      Floor(
        number: 1,
        floorMapImage: 'assets/images/IT_FIRST_FLOOR.jpg',
        rooms: [
          Room(
            name: 'IT-Washroom-1',
            description: 'Common Room\nStudents Washroom',
          ),
          Room(name: 'Ladies-Washroom-1', description: 'Staff Washroom'),
          Room(name: 'Gents-Washroom-1', description: 'Staff Washroom'),
          Room(
            name: 'IT SEMINAR HALL',
            description: 'Department of IT - Mac Center Of Excellence',
          ),
          Room(
            name: 'CL-9',
            description:
                'Computer Lab-9 (CSE)\nPG Computer Lab (CSE)\nDS Lab\nAdvanced Data Structures Lab\nAdvanced Algorithms Lab\n Deep Learing Lab',
          ),
          Room(
            name: 'CL-6',
            description:
                'Centre for Data Analytics\nComputer Lab-6 (CSE)\n Operating Systems & Microprocessor Lab\nMachine Learning Lab',
          ),
          Room(name: 'F108', description: 'M.Tech(PEED)'),
          Room(name: 'F109', description: 'M.Tech(CN & IS)'),
          Room(name: 'F107', description: 'M.Tech(WMC)'),
          Room(name: 'F1', description: 'Lecture Hall'),
          Room(name: 'F2', description: 'Lecture Hall'),
          Room(
            name: 'F106',
            description: 'Staff Room',
            faculty: [
              Faculty(
                name: 'Y. Rajalakshmi',
                designation: 'Assistant Professor     M.Tech',
              ),
              Faculty(
                name: 'Pooja Vitthalrao Phad',
                designation: 'Assistant Professor     M.Tech',
              ),
              Faculty(
                name: 'G. Divya',
                designation: 'Assistant Professor     M.Tech',
              ),
              Faculty(
                name: 'S. Radhika',
                designation: 'Assistant Professor IT Department',
              ),
            ],
          ),
        ],
      ),
      Floor(
        number: 2,
        floorMapImage: 'assets/images/IT_SECOND_FLOOR.jpg',
        rooms: [
          Room(
            name: 'IT-Washroom-2',
            description: 'Common Room\nStudents Washroom',
          ),
          Room(name: 'Ladies-Washroom-2', description: 'Staff Washroom'),
          Room(name: 'Gents-Washroom-2', description: 'Staff Washroom'),
          Room(
            name: 'IT SEMINAR HALL',
            description: 'Department of IT - Mac Center Of Excellence',
          ),
          Room(
            name: 'CC-3',
            description: 'Research Centre\nIT Computer Centre-III\nNP & WT Lab',
          ),
          Room(
            name: 'CC-4',
            description: 'IT Computer Centre-IV\nDCCN & IoT Lab',
          ),
          Room(
            name: 'CC-5',
            description: 'IT Computer Centre-V\nOOPS & SE Lab',
          ),
          Room(name: 'F215', description: 'Department Library (IT)'),
          Room(name: 'F3', description: 'Lecture Hall'),
          Room(name: 'F4', description: 'Lecture Hall'),
          Room(name: 'F5', description: 'Lecture Hall'),
          Room(name: 'F6', description: 'Lecture Hall'),
          Room(name: 'F7', description: 'Lecture Hall'),
          Room(name: 'F206', description: 'IT Gents Staff Room'),
          Room(name: 'F206A', description: 'IT Ladies Staff Room'),
          Room(
            name: 'F214',
            description: 'Staff Room',
            faculty: [
              Faculty(
                name: 'K. Sridevi',
                designation: 'Assistant Professor, M.Tech',
              ),
              Faculty(
                name: 'M. Deepthi',
                designation: 'Assistant Professor, M.Tech',
              ),
              Faculty(
                name: 'U. Jyothi',
                designation: 'Assistant Professor, M.Tech',
              ),
            ],
          ),
          Room(
            name: 'F213',
            description: 'Staff Room',
            faculty: [
              Faculty(
                name: 'Dr. I. Ravi Prakash Reddy',
                designation: 'Dean - Placements & Corporate Relations',
              ),
            ],
          ),
          Room(
            name: 'F212',
            description: 'Staff Room',
            faculty: [
              Faculty(
                name: 'P. Purushottham',
                designation: 'Assistant Professor, M.Tech',
              ),
              Faculty(
                name: 'Vijay Balla',
                designation: 'Assistant Professor, M.Tech',
              ),
            ],
          ),
          Room(
            name: 'F205',
            description: 'IT HOD',
            faculty: [
              Faculty(
                name: 'Dr. S. Ramacharan',
                designation: 'Head Of the Department -IT',
              ),
            ],
          ),
        ],
      ),
      Floor(
        number: 3,
        floorMapImage: 'assets/images/IT_THIRD_FLOOR.png',
        rooms: [
          Room(
            name: 'IT-Washroom-3',
            description: 'Common Room\nStudents Washroom',
          ),
          Room(name: 'Ladies-Washroom-3', description: 'Staff Washroom'),
          Room(name: 'Gents-Washroom-3', description: 'Staff Washroom'),
          Room(name: 'SEMINAR HALL F10B', description: 'Seminar Hall'),
          Room(name: 'Placement Office', description: 'Placements'),
          Room(
            name: 'CST-1',
            description:
                'CST Computer Center-1\nOOP JAVA Lab\nML & DBMS Lab\nBig Data Analytics Lab\nFull Stack Development Lab',
          ),
          Room(
            name: 'CL-14',
            description: 'IT Computer Centre-IV\nDCCN & IoT Lab',
          ),
          Room(name: 'F8', description: 'Lecture Hall'),
          Room(name: 'F9', description: 'Lecture Hall'),
          Room(name: 'F10', description: 'Lecture Hall'),
          Room(
            name: 'F308',
            description: 'Staff Room',
            faculty: [
              Faculty(
                name: 'M. Jyothi',
                designation: 'Assistant Professor, M.Tech',
              ),
              Faculty(
                name: 'K. Madhavi',
                designation: 'Assistant Professor, M.Tech',
              ),
              Faculty(
                name: 'K. Ramyasri',
                designation: 'Assistant Professor, M.Tech',
              ),
            ],
          ),
          Room(
            name: 'F309',
            description: 'Staff Room',
            faculty: [
              Faculty(
                name: 'ch. Ganapathy Reddy',
                designation: 'Professor, ECE',
              ),
              Faculty(
                name: 'Prof. G. Gopinath',
                designation: 'Assistant Professor ,M.Tech',
              ),
              Faculty(
                name: 'K. Ramyasri',
                designation: 'Adjunct Professor, M.E ,EEE',
              ),
            ],
          ),
          Room(
            name: 'F310',
            description: 'Staff Room',
            faculty: [
              Faculty(
                name: 'Dr. D. Kavitha',
                designation: 'Assistant Professor, Ph.D',
              ),
              Faculty(
                name: 'Mrs. Saritha Dasari',
                designation: 'Assistant Professor, M.Tech(Ph.D)',
              ),
              Faculty(
                name: 'Mrs. Sukerthi S.',
                designation: 'Assistant Professor, M.Tech',
              ),
              Faculty(
                name: 'Mrs. M. Madhavilatha',
                designation: 'Assistant Professor, M.Tech',
              ),
              Faculty(
                name: 'Mrs. Shilpa T.',
                designation: 'Assistant Professor, M.Tech(Ph.D)',
              ),
              Faculty(
                name: 'Mrs. Pallavi S.',
                designation: 'Assistant Professor, M.Tech',
              ),
            ],
          ),
        ],
      ),
    ],
  ),
  Block(
    name: 'Admin',
    floors: [
      Floor(
        number: 1,
        floorMapImage: 'assets/images/admin-1.jpg',
        rooms: [
          Room(name: 'Gents-Admin-Washroom-1', description: 'Staff Washroom'),
          Room(
            name: 'Ladies-Admin-Washroom-1',
            description: 'Students Washroom',
          ),
          Room(name: 'A1', description: 'Admin Lab-1'),
          Room(name: 'A2', description: 'Admin Lab-2'),
          Room(name: 'L1', description: 'Lecture Hall - 1'),
          Room(name: 'L2', description: 'Lecture Hall - 2'),
          Room(name: 'Cabin-1', description: 'Staff Room'),
        ],
      ),
      Floor(
        number: 2,
        floorMapImage: 'assets/images/admin-2.jpg',
        rooms: [
          Room(name: 'Gents-Admin-Washroom-2', description: 'Staff Washroom'),
          Room(
            name: 'Ladies-Admin-Washroom-2',
            description: 'Students Washroom',
          ),
          Room(name: 'A3', description: 'Admin Lab-3'),
          Room(name: 'A4', description: 'Admin Lab-4'),
          Room(name: 'L3', description: 'Lecture Hall - 3'),
          Room(name: 'L4', description: 'Lecture Hall - 4'),
          Room(name: 'Cabin-2', description: 'Staff Room'),
        ],
      ),
    ],
  ),
];

RoomLocation? findRoomLocation(String query) {
  for (var block in blocks) {
    for (var floor in block.floors) {
      for (var room in floor.rooms) {
        if (room.name.toLowerCase() == query.toLowerCase()) {
          return RoomLocation(
            block: block.name,
            floor: floor.number,
            floorMapImage: floor.floorMapImage,
            roomName: room.name,
            roomDescription: room.description,
          );
        }
        if (room.faculty != null) {
          for (var faculty in room.faculty!) {
            if (faculty.name.toLowerCase() == query.toLowerCase()) {
              return RoomLocation(
                block: block.name,
                floor: floor.number,
                floorMapImage: floor.floorMapImage,
                roomName: room.name,
                matchedFaculty: faculty,
                roomDescription: room.description,
              );
            }
          }
        }
      }
    }
  }
  return null;
}

List<String> getAllSearchableTerms() {
  Set<String> terms = {};
  for (var block in blocks) {
    for (var floor in block.floors) {
      for (var room in floor.rooms) {
        terms.add(room.name);
        if (room.faculty != null) {
          for (var faculty in room.faculty!) {
            terms.add(faculty.name);
          }
        }
      }
    }
  }
  return terms.toList();
}

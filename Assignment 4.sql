CREATE TABLE StudentDetails (
    StudentId TEXT PRIMARY KEY,
    StudentName TEXT,
    GPA NUMERIC(3,2),
    Branch TEXT,
    Section TEXT
);

CREATE TABLE SubjectDetails (
    SubjectId TEXT PRIMARY KEY,
    SubjectName TEXT,
    MaxSeats INT,
    RemainingSeats INT
);

CREATE TABLE StudentPreference (
    StudentId TEXT,
    SubjectId TEXT,
    Preference INT,
    PRIMARY KEY (StudentId, Preference),
    FOREIGN KEY (StudentId) REFERENCES StudentDetails(StudentId),
    FOREIGN KEY (SubjectId) REFERENCES SubjectDetails(SubjectId)
);

CREATE TABLE Allotments (
    StudentId TEXT PRIMARY KEY,
    SubjectId TEXT,
    FOREIGN KEY (StudentId) REFERENCES StudentDetails(StudentId),
    FOREIGN KEY (SubjectId) REFERENCES SubjectDetails(SubjectId)
);

CREATE TABLE UnallotedStudents (
    StudentId TEXT PRIMARY KEY,
    FOREIGN KEY (StudentId) REFERENCES StudentDetails(StudentId)
);

INSERT INTO StudentDetails VALUES
('159103036', 'Mohit Agarwal', 8.9, 'CCE', 'A'),
('159103037', 'Rohit Agarwal', 5.2, 'CCE', 'A'),
('159103038', 'Shohit Garg', 7.1, 'CCE', 'B'),
('159103039', 'Mrinal Malhotra', 7.9, 'CCE', 'A'),
('159103040', 'Mehreet Singh', 5.6, 'CCE', 'A'),
('159103041', 'Arjun Tehlan', 9.2, 'CCE', 'B');

INSERT INTO SubjectDetails VALUES
('PO1491', 'Basics of Political Science', 60, 2),
('PO1492', 'Basics of Accounting', 120, 119),
('PO1493', 'Basics of Financial Markets', 90, 90),
('PO1494', 'Eco philosophy', 60, 50),
('PO1495', 'Automotive Trends', 60, 60);

delete from StudentPreference;

INSERT INTO StudentPreference
SELECT s.StudentId, p.SubjectId, p.Preference
FROM (
    VALUES 
        ('PO1491', 1),
        ('PO1492', 2),
        ('PO1493', 3),
        ('PO1494', 4),
        ('PO1495', 5)
) AS p(SubjectId, Preference),
StudentDetails s;


CREATE OR REPLACE PROCEDURE allocate_subjects()
LANGUAGE plpgsql
AS $$
DECLARE
    s RECORD;
    pref RECORD;
    allocated BOOLEAN;
BEGIN
    DELETE FROM Allotments;
    DELETE FROM UnallotedStudents;

    FOR s IN SELECT * FROM StudentDetails ORDER BY GPA DESC LOOP
        allocated := FALSE;

        FOR pref IN
            SELECT * FROM StudentPreference
            WHERE StudentId = s.StudentId
            ORDER BY Preference ASC
        LOOP
            IF (SELECT RemainingSeats FROM SubjectDetails WHERE SubjectId = pref.SubjectId) > 0 THEN
                INSERT INTO Allotments(StudentId, SubjectId) VALUES (s.StudentId, pref.SubjectId);

                UPDATE SubjectDetails
                SET RemainingSeats = RemainingSeats - 1
                WHERE SubjectId = pref.SubjectId;

                allocated := TRUE;
                EXIT;
            END IF;
        END LOOP;

        IF NOT allocated THEN
            INSERT INTO UnallotedStudents(StudentId) VALUES (s.StudentId);
        END IF;
    END LOOP;
END;
$$;

CALL allocate_subjects();

SELECT * FROM Allotments;

SELECT * FROM UnallotedStudents;

SELECT * FROM SubjectDetails;

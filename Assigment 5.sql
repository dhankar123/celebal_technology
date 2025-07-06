CREATE TABLE SubjectAllotments (
    StudentId VARCHAR(20),
    SubjectId VARCHAR(20),
    Is_Valid SMALLINT CHECK (Is_Valid in (0,1))
);

CREATE TABLE SubjectRequest (
    StudentId VARCHAR(20),
    SubjectId VARCHAR(20)
);

select * from SubjectAllotments;
INSERT INTO SubjectAllotments (StudentId, SubjectId, Is_Valid) VALUES
('159103036', 'PO1491', 1),
('159103036', 'PO1492', 0),
('159103036', 'PO1493', 0),
('159103036', 'PO1494', 0),
('159103036', 'PO1495', 0);

INSERT INTO SubjectRequest (StudentId, SubjectId) VALUES
('159103036', 'PO1496');

CREATE OR REPLACE FUNCTION ProcessSubjectRequests()
RETURNS void
LANGUAGE plpgsql
AS $$
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN SELECT * FROM SubjectRequest LOOP

        IF EXISTS (
            SELECT 1 FROM SubjectAllotments
            WHERE StudentId = rec.StudentId AND SubjectId = rec.SubjectId
        ) THEN
            IF EXISTS (
                SELECT 1 FROM SubjectAllotments
                WHERE StudentId = rec.StudentId AND Is_Valid = 1 AND SubjectId <> rec.SubjectId
            ) THEN
                UPDATE SubjectAllotments
                SET Is_Valid = 0
                WHERE StudentId = rec.StudentId AND Is_Valid = 0;

                UPDATE SubjectAllotments
                SET Is_Valid = 1
                WHERE StudentId = rec.StudentId AND SubjectId = rec.SubjectId;
            END IF;
        ELSE
            IF EXISTS (
                SELECT 1 FROM SubjectAllotments
                WHERE StudentId = rec.StudentId AND Is_Valid = 1 AND SubjectId <> rec.SubjectId
            ) THEN
                UPDATE SubjectAllotments
                SET Is_Valid = 0
                WHERE StudentId = rec.StudentId AND Is_Valid = 1;
            END IF;

            INSERT INTO SubjectAllotments (StudentId, SubjectId, Is_Valid)
            VALUES (rec.StudentId, rec.SubjectId, 1);
        END IF;

    END LOOP;

    DELETE FROM SubjectRequest;
END;
$$;


SELECT ProcessSubjectRequests();

SELECT * FROM SubjectAllotments;

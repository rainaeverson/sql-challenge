CREATE TABLE "employees" (
    "emp_id" int,
    "emp_no" int NOT NULL,
    "emp_title_id" varchar(10) NOT NULL,
    "birth_date" date NOT NULL,
    "first_name" varchar(30) NOT NULL,
    "last_name" varchar(30) NOT NULL,
    "sex" varchar(1) NOT NULL,
    "hire_date" date NOT NULL,
    CONSTRAINT "pk_emp_id" PRIMARY KEY (
        "emp_no"
    )
);

CREATE TABLE "departments" (
    "dept_no" varchar(10) NOT NULL,
    "dept_name" varchar(40) NOT NULL,
    CONSTRAINT "pk_dept_no" PRIMARY KEY (
        "dept_no"
    )
);

CREATE TABLE "dept_manager" (
    "dept_no" varchar(10) NOT NULL,
    "emp_no" int NOT NULL,
    CONSTRAINT "pk_emp_no" PRIMARY KEY (
        "emp_no"
    )
);

CREATE TABLE "dept_emp" (
    "emp_no" int NOT NULL,
    "dept_no" varchar(10) NOT NULL,
    CONSTRAINT "pk_emp_no" PRIMARY KEY (
        "emp_no"
    )
);

CREATE TABLE "salaries" (
    "emp_no" int NOT NULL,
    "salary" int NOT NULL,
    CONSTRAINT "pk_emp_no" PRIMARY KEY (
        "emp_no"
    )
);

CREATE TABLE "titles" (
    "title_id" varchar(10) NOT NULL,
    "title" varchar(15) NOT NULL,
    CONSTRAINT "pk_title_id" PRIMARY KEY (
        "title_id"
    )
);



ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments"("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees"("emp_no");


ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments"("dept_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees"("emp_no");


ALTER TABLE "salaries" ADD CONSTRAINT "fk_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees"("emp_no");


ALTER TABLE "employees" ADD CONSTRAINT "fk_emp_title_id" FOREIGN KEY("title_id")
REFERENCES "titles"("title_id");
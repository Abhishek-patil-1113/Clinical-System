USE [clinic]
GO

/****** Object:  Table [dbo].[allergy_history]    Script Date: 05-14-2022 13:23:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[allergy_history](
	[allergy_id] [int] NOT NULL,
	[patient_id] [int] NULL,
	[allergy] [varchar](70) NULL,
	[allergy_start_dt] [date] NULL,
 CONSTRAINT [PK_allergy_history] PRIMARY KEY CLUSTERED 
(
	[allergy_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[appt]    Script Date: 05-14-2022 13:23:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[appt](
	[appt_no] [int] NOT NULL,
	[staff_id] [int] NULL,
	[appt_reason] [varchar](90) NULL,
	[time_slot] [time](7) NULL,
	[appt_date] [date] NULL,
	[patient_id] [int] NULL,
	[doctor_id] [int] NULL,
 CONSTRAINT [PK_appt] PRIMARY KEY CLUSTERED 
(
	[appt_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[clinic_detail]    Script Date: 05-14-2022 13:23:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[clinic_detail](
	[clinic_name] [varchar](60) NULL,
	[clinic_addrs] [varchar](150) NULL,
	[clinic_area] [varchar](50) NULL,
	[clinic_city] [varchar](25) NULL,
	[clinic_pin] [int] NULL,
	[clinic_contact] [varchar](10) NULL,
	[clinic_website] [varchar](50) NULL,
	[clinic_email] [varchar](50) NULL,
	[start_time] [time](7) NULL,
	[end_time] [time](7) NULL,
	[am_pm_start] [varchar](2) NULL,
	[am_pm_end] [varchar](2) NULL,
	[clinic_id] [int] NOT NULL,
 CONSTRAINT [PK_clinic_detail] PRIMARY KEY CLUSTERED 
(
	[clinic_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[cronic_disease]    Script Date: 05-14-2022 13:23:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[cronic_disease](
	[cronic_disease_id] [int] NOT NULL,
	[patient_id] [int] NULL,
	[cronic_disease] [varchar](80) NULL,
	[cronic_disease_start_dt] [date] NULL,
 CONSTRAINT [PK_cronic_disease] PRIMARY KEY CLUSTERED 
(
	[cronic_disease_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[investigation]    Script Date: 05-14-2022 13:23:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[investigation](
	[visit_invst_id] [int] NOT NULL,
	[visit_no] [int] NULL,
	[investigation] [varchar](250) NULL,
	[result] [varchar](250) NULL,
 CONSTRAINT [PK_investigation] PRIMARY KEY CLUSTERED 
(
	[visit_invst_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[medication]    Script Date: 05-14-2022 13:23:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[medication](
	[visit_med_id] [int] NOT NULL,
	[visit_no] [int] NULL,
	[medicine] [varchar](70) NULL,
	[frequency] [varchar](50) NULL,
	[no_of_days] [int] NULL,
 CONSTRAINT [PK_medication] PRIMARY KEY CLUSTERED 
(
	[visit_med_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[medication_history]    Script Date: 05-14-2022 13:23:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[medication_history](
	[patient_med_id] [int] NOT NULL,
	[patient_id] [int] NULL,
	[medicine] [varchar](60) NULL,
	[frequency] [varchar](50) NULL,
 CONSTRAINT [PK_medication_history] PRIMARY KEY CLUSTERED 
(
	[patient_med_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[patient]    Script Date: 05-14-2022 13:23:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[patient](
	[patient_id] [int] NOT NULL,
	[patient_name] [varchar](40) NULL,
	[patient_addrs] [varchar](150) NULL,
	[patient_area] [varchar](50) NULL,
	[patient_city] [varchar](25) NULL,
	[patient_pin] [int] NULL,
	[patient_gender] [varchar](8) NULL,
	[patient_dob] [date] NULL,
	[patient_contact] [varchar](10) NULL,
	[patient_email] [varchar](40) NULL,
	[patient_ref] [varchar](50) NULL,
	[patient_blood_group] [varchar](5) NULL,
	[reg_dt] [date] NULL,
 CONSTRAINT [PK_patient] PRIMARY KEY CLUSTERED 
(
	[patient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[payment_collection]    Script Date: 05-14-2022 13:23:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[payment_collection](
	[payment_id] [int] NOT NULL,
	[patient_id] [int] NULL,
	[mode_of_pay] [varchar](10) NULL,
	[type_of_pay] [varchar](30) NULL,
	[amount] [int] NULL,
	[payment_dt] [date] NULL,
 CONSTRAINT [PK_payment_collection] PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[staff]    Script Date: 05-14-2022 13:23:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[staff](
	[staff_id] [int] NOT NULL,
	[staff_name] [varchar](40) NULL,
	[staff_addrs] [varchar](150) NULL,
	[staff_area] [varchar](50) NULL,
	[staff_city] [varchar](25) NULL,
	[staff_pin] [int] NULL,
	[staff_contact] [varchar](10) NULL,
	[staff_gender] [varchar](8) NULL,
	[staff_aadhar] [varchar](12) NULL,
	[staff_email] [varchar](40) NULL,
	[staff_dob] [date] NULL,
	[staff_doj] [date] NULL,
	[staff_qualification] [varchar](50) NULL,
	[staff_experience] [varchar](20) NULL,
	[staff_work_type] [varchar](20) NULL,
	[password] [varchar](50) NULL,
 CONSTRAINT [PK_staff] PRIMARY KEY CLUSTERED 
(
	[staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[type_of_pay]    Script Date: 05-14-2022 13:23:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[type_of_pay](
	[category] [varchar](30) NULL,
	[value] [int] NULL,
	[unit] [varchar](5) NULL
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[visit]    Script Date: 05-14-2022 13:23:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[visit](
	[visit_no] [int] NOT NULL,
	[visit_type] [varchar](20) NULL,
	[visit_time] [time](7) NULL,
	[visit_date] [date] NULL,
	[doctor_id] [int] NULL,
	[staff_id] [int] NULL,
	[patient_id] [int] NULL,
	[symptoms] [varchar](525) NULL,
	[diagnosis] [varchar](525) NULL,
	[temperature] [int] NULL,
	[bp] [varchar](15) NULL,
	[oxy_level] [int] NULL,
	[weight] [varchar](5) NULL,
	[height] [varchar](5) NULL,
	[am_pm] [varchar](2) NULL,
 CONSTRAINT [PK_visit] PRIMARY KEY CLUSTERED 
(
	[visit_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


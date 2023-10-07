select *
from PortfolioProject..CovidDeaths$

select *
from PortfolioProject..CovidVaccination$

select Location, date, total_cases, new_cases, total_deaths, population_density
from PortfolioProject..CovidDeaths$
order by 1,2


-- Looking at Total cases vs Total deaths
-- shows likelihood of dying if you contract covid in your country
select Location, date, total_cases, total_deaths, (convert(float, total_deaths)/nullif(convert(float, total_cases), 0))*100 as DeathPercentage
from PortfolioProject..CovidDeaths$
where location like '%Kazakhstan%'
order by 1,2

-- looking at total cases vs population
select Location, date, total_cases, population_density, (convert(float, total_deaths)/nullif(convert(float, total_cases), 0))*100 as DeathPercentage
from PortfolioProject..CovidDeaths$
where location like '%Kazakhstan%'
order by 1,2


-- LET'S BREAK THINGS DOW N BY CONTINENT

-- showing countries with highest death count per population
select location, max(cast(total_deaths as int)) as TotalDeathCount
from PortfolioProject.. CovidDeaths$
where continent is not null
group by location
order by TotalDeathCount desc

select *
from PortfolioProject..CovidDeaths$
where continent is not null
order by 3,4


-- showing continents with highest death count per popullation

select continent, max(cast(total_deaths as int)) as TotalDeathCount
from PortfolioProject..CovidDeaths$
where continent is not null
group by continent
order by TotalDeathCount desc


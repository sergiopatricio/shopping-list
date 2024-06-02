// https://getbootstrap.com/docs/5.3/customize/color-modes/#javascript
/*!
 * Color mode toggler for Bootstrap's docs (https://getbootstrap.com/)
 * Copyright 2011-2024 The Bootstrap Authors
 * Licensed under the Creative Commons Attribution 3.0 Unported License.
 */
// Tweaked for shopping list app.

(() => {
  'use strict'

  const getStoredTheme = () => localStorage.getItem('theme')
  const setStoredTheme = theme => localStorage.setItem('theme', theme)

  const getPreferredTheme = () => {
    const storedTheme = getStoredTheme()
    if (storedTheme) {
      return storedTheme
    }

    return window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light'
  }

  const setTheme = theme => {
    if (theme === 'auto') {
      document.documentElement.setAttribute('data-bs-theme', (window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light'))
    } else {
      document.documentElement.setAttribute('data-bs-theme', theme)
    }
  }

  setTheme(getPreferredTheme())

  const showActiveTheme = (theme, focus = false) => {
    const themeSwitcher = document.querySelector('#bd-theme')

    if (!themeSwitcher) {
      return
    }

    const btnToActive = document.querySelector(`[data-bs-theme-value="${theme}"]`)

    document.querySelectorAll('[data-bs-theme-value]').forEach(element => {
      element.classList.remove('active')
    })

    btnToActive.classList.add('active')

    if (focus) {
      themeSwitcher.focus()
    }
  }

  window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', () => {
    const storedTheme = getStoredTheme()
    if (storedTheme !== 'light' && storedTheme !== 'dark') {
      setTheme(getPreferredTheme())
    }
  })

  const toggleTheme = (event) => {
    const toggle = event.target
    const theme = toggle.getAttribute('data-bs-theme-value')
    setStoredTheme(theme)
    setTheme(theme)
    showActiveTheme(theme, true)
    // close the menu on small screens
    document.querySelector('.navbar-collapse').classList.remove('show')
  }

  const addEventListeners = () => {
    document.querySelectorAll('[data-bs-theme-value]')
      .forEach(toggle => {
        toggle.removeEventListener('click', toggleTheme); // Remove previous listener to avoid duplicates
        toggle.addEventListener('click', toggleTheme)
      })
  }

  document.addEventListener('turbo:load', () => {
    showActiveTheme(getPreferredTheme())
    addEventListeners();
  });
})()

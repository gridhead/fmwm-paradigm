# fmwm-paradigm

Fedora Media Writer Modernization Paradigm

This DESIGN PROTOTYPE is a WORK IN PROGRESS

## Animation

![](https://raw.githubusercontent.com/gridhead/fmwm-paradigm/refs/heads/main/anim.gif)

## Motivation

This design prototype is an exploration of what Fedora Media Writer could 
potentially become. It is neither a final design nor a demand for change. It is
a conversation starter – a concrete documented reference point for discussing
modernization with the upstream maintainers, and the wider community. All the
things done here are subject to revision, and the goal here is collaboration,
not prescription. To add to that, this has been a learning experience for me
since I learned QML recently.

### First impressions really matter

For a vast majority of folks here, Fedora Media Writer is the very first point
of interaction they have with Fedora Project. It is the gateway through which
curious users take their first step into Fedora Linux ecosystem, and therefore
to the Fedora Project community too. That first impression around the look of
the tooling and the feel of the experience shapes whether someone walks away
excited to explore further or is discouraged before they even boot into the
live Fedora Linux environment.

Most of the people who contribute to the Fedora Project community had started
off as Fedora Linux users first, and arguably, most of those users arrived via
Fedora Media Writer. If we want a thriving community and a welcoming space, it
is in our best interests to get this moment right. A hospitable and intuitive
beginner's experience signals that Fedora Project values efforts spent in the
out-of-the-box experience that leads to the user potentially wanting to become
a contributor in the community.

### Emerging case for modernization

The experience, in its current state, while functional, feels archaic. It tries
to feel at home across various platforms using the default Qt platform styling,
which means it never quite achieves that on any platform, i.e. neither across 
desktop environments nor on proprietary platforms. Rather than playing catchup
with the look and feel of every platform, a thoughtfully designed custom-built
interface can deliver a consistent and polished experience that establishes the
Fedora Project brand identity.

Beyond the (immediately noticeable) visual appeal, there are authentic user
experience improvements that can be made, Better information hierarchy, clearer
navigation through variants, current affairs of the Fedora Project community,
and a design language that communicates approachability – these are the changes
that make a tool genuinely easier to use, not just prettier to look at. Along
with those changes, we can also use this opportunity to onboard contributors to
maintain the project codebase.

## Disclosure

- No AI tooling generated codebase was used here.
- Everything here was purely crafted by bare hands.
- Some AI tooling was used to accelerate the QML learning, by using diverse examples.
- Expedited learning using AI tooling is incredibly helpful on an intermediate level.
- Participation under [AI Assisted Contribution Policy](https://docs.fedoraproject.org/en-US/council/policy/ai-contribution-policy/) are welcome here however.
- I might use consider using some AI tooling in the future though for inspirations.
- It is intended to be both a learning experience and a reference modernization.
- So all functional contributions are to be made against the upstream repository.

## Information

- The UI has a minimum width of 800 pixels and a minimum height of 480 pixels.
- The UI is intended to be responsive and can be resized by dragging edges/vertices.
- The UI has a custom built title bar and hence, appears more polished in general.
- The UI is able to adapt with the system theme and also supports manual switching.
- Everything done so far is subject to change and is not final representation.
- The Python codebase is for prototyping purposes and is not production intended.
- Most icon assets here are simply placeholders and will be replaced in the future.
- The legibility of the text elements has not been scientifically evaluated yet.

## Execution

1. Create a fresh Python virtual environment.
   ```bash
   $ virtualenv venv
   ```

2. Activate the newly created virtual environment.
   ```bash
   $ source venv/bin/activate
   ```

3. Install the project dependencies.
   ```bash
   (venv) $ pip3 install pyside6
   ```

4. Explore the application project design prototype.
   ```bash
   (venv) $ python3 main.py
   ```

## Illustrations

- Home page
  - Light theme  
    ![](https://raw.githubusercontent.com/gridhead/fmwm-paradigm/refs/heads/main/screen/home-lite.png)
  - Dark theme  
    ![](https://raw.githubusercontent.com/gridhead/fmwm-paradigm/refs/heads/main/screen/home-dark.png)

- Official Editions
  - Light theme  
    ![](https://raw.githubusercontent.com/gridhead/fmwm-paradigm/refs/heads/main/screen/fstd-lite.png)
  - Dark theme  
    ![](https://raw.githubusercontent.com/gridhead/fmwm-paradigm/refs/heads/main/screen/fstd-dark.png)

- Atomic Desktops
  - Light theme  
    ![](https://raw.githubusercontent.com/gridhead/fmwm-paradigm/refs/heads/main/screen/atom-lite.png)
  - Dark theme  
    ![](https://raw.githubusercontent.com/gridhead/fmwm-paradigm/refs/heads/main/screen/atom-dark.png)

- Fedora Spins
  - Light theme  
    ![](https://raw.githubusercontent.com/gridhead/fmwm-paradigm/refs/heads/main/screen/spin-lite.png)
  - Dark theme  
    ![](https://raw.githubusercontent.com/gridhead/fmwm-paradigm/refs/heads/main/screen/spin-dark.png)

- Fedora Labs
  - Light theme  
    ![](https://raw.githubusercontent.com/gridhead/fmwm-paradigm/refs/heads/main/screen/labs-lite.png)
  - Dark theme  
    ![](https://raw.githubusercontent.com/gridhead/fmwm-paradigm/refs/heads/main/screen/labs-dark.png)

- Custom Image
  - Light theme  
    ![](https://raw.githubusercontent.com/gridhead/fmwm-paradigm/refs/heads/main/screen/cust-lite.png)
  - Dark theme  
    ![](https://raw.githubusercontent.com/gridhead/fmwm-paradigm/refs/heads/main/screen/cust-dark.png)

- Information
  - Light theme  
    ![](https://raw.githubusercontent.com/gridhead/fmwm-paradigm/refs/heads/main/screen/cust-lite.png)
  - Dark theme  
    ![](https://raw.githubusercontent.com/gridhead/fmwm-paradigm/refs/heads/main/screen/cust-dark.png)

- Picker
  - Light theme  
    ![](https://raw.githubusercontent.com/gridhead/fmwm-paradigm/refs/heads/main/screen/deep-lite.png)
  - Dark theme  
    ![](https://raw.githubusercontent.com/gridhead/fmwm-paradigm/refs/heads/main/screen/deep-dark.png)

- Picker
  - Light theme
    - Note 01  
      ![](https://raw.githubusercontent.com/gridhead/fmwm-paradigm/refs/heads/main/screen/deep-note-00-lite.png)
    - Note 02  
      ![](https://raw.githubusercontent.com/gridhead/fmwm-paradigm/refs/heads/main/screen/deep-note-01-lite.png)
    - Note 03  
      ![](https://raw.githubusercontent.com/gridhead/fmwm-paradigm/refs/heads/main/screen/deep-note-02-lite.png)
  - Dark theme
    - Note 01  
      ![](https://raw.githubusercontent.com/gridhead/fmwm-paradigm/refs/heads/main/screen/deep-note-00-dark.png)
    - Note 02  
      ![](https://raw.githubusercontent.com/gridhead/fmwm-paradigm/refs/heads/main/screen/deep-note-01-dark.png)
    - Note 03  
      ![](https://raw.githubusercontent.com/gridhead/fmwm-paradigm/refs/heads/main/screen/deep-note-02-dark.png)

- Confirmation
  - Light theme  
    ![](https://raw.githubusercontent.com/gridhead/fmwm-paradigm/refs/heads/main/screen/conf-lite.png)
  - Dark theme  
    ![](https://raw.githubusercontent.com/gridhead/fmwm-paradigm/refs/heads/main/screen/conf-dark.png)

- Progress
  - Light theme
    - Fetching  
      ![](https://raw.githubusercontent.com/gridhead/fmwm-paradigm/refs/heads/main/screen/prog-down-lite.png)
    - Flashing  
      ![](https://raw.githubusercontent.com/gridhead/fmwm-paradigm/refs/heads/main/screen/prog-make-lite.png)
    - Complete  
      ![](https://raw.githubusercontent.com/gridhead/fmwm-paradigm/refs/heads/main/screen/prog-done-lite.png)
  - Dark theme
    - Fetching  
      ![](https://raw.githubusercontent.com/gridhead/fmwm-paradigm/refs/heads/main/screen/prog-down-dark.png)
    - Flashing  
      ![](https://raw.githubusercontent.com/gridhead/fmwm-paradigm/refs/heads/main/screen/prog-make-dark.png)
    - Complete  
      ![](https://raw.githubusercontent.com/gridhead/fmwm-paradigm/refs/heads/main/screen/prog-done-dark.png)

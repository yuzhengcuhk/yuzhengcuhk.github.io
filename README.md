# Yash Patel - Academic Website

This is my personal academic website built with [Hugo](https://gohugo.io/) and the [Hugo Blox Builder](https://hugoblox.com/) Academic theme.

## 🚀 Features

- **Modern Design**: Clean, professional academic website template
- **Responsive**: Mobile-friendly design that works on all devices
- **Fast**: Built with Hugo for optimal performance
- **Academic Focus**: Designed specifically for researchers and academics
- **Easy to Update**: Simple markdown-based content management

## 🛠️ Technology Stack

- **Static Site Generator**: Hugo v0.148.2+
- **Theme**: Hugo Blox Builder Academic Theme
- **Styling**: Tailwind CSS
- **Deployment**: GitHub Pages

## 📁 Project Structure

```
yashpatel5400.github.io/
├── config/                    # Hugo configuration files
│   └── _default/
│       ├── hugo.yaml         # Main Hugo configuration
│       ├── module.yaml       # Hugo modules configuration
│       ├── params.yaml       # Site parameters and content
│       ├── menus.yaml        # Navigation menu structure
│       └── languages.yaml    # Language settings
├── content/                   # Website content
│   ├── authors/              # Author profiles
│   ├── publications/         # Academic publications
│   ├── projects/             # Portfolio projects
│   └── _index.md            # Home page content
├── static/                    # Static assets
│   ├── images/               # Images and avatars
│   └── files/                # PDFs and other files
├── go.mod                     # Go modules configuration
└── README.md                 # This file
```

## 🚀 Getting Started

### Prerequisites

- [Hugo Extended](https://gohugo.io/installation/) (v0.148.2+)
- [Go](https://golang.org/doc/install) (v1.25+)

### Local Development

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yashpatel5400/yashpatel5400.github.io.git
   cd yashpatel5400.github.io
   ```

2. **Install Hugo modules**:
   ```bash
   hugo mod tidy
   ```

3. **Start the development server**:
   ```bash
   hugo server --bind 0.0.0.0 --port 1313
   ```

4. **View the site**: Open [http://localhost:1313](http://localhost:1313) in your browser

### Building for Production

```bash
hugo
```

This creates a `public/` directory with the built site ready for deployment.

## 📝 Content Management

### Adding Publications

Create new files in `content/publications/` with the following front matter:

```markdown
---
title: "Publication Title"
date: 2024-01-01
draft: false
publication_types: ["1"]  # 1 = article, 2 = book, etc.
authors: ["yash-patel"]
summary: "Brief description of the publication"
tags: ["machine-learning", "statistics"]
---
```

### Adding Projects

Create new files in `content/projects/` with the following front matter:

```markdown
---
title: "Project Name"
date: 2024-01-01
draft: false
tags: ["python", "machine-learning"]
external_link: "https://github.com/username/project"
---
```

### Updating Profile

Edit `content/authors/yash-patel/_index.md` to update your personal information, bio, and social links.

## 🎨 Customization

### Site Configuration

- **Main settings**: Edit `config/_default/hugo.yaml`
- **Site parameters**: Edit `config/_default/params.yaml`
- **Navigation**: Edit `config/_default/menus.yaml`
- **Modules**: Edit `config/_default/module.yaml`

### Styling

The site uses Tailwind CSS through Hugo Blox Builder. Custom styles can be added in the `assets/` directory.

## 🚀 Deployment

### GitHub Pages

1. **Build the site**:
   ```bash
   hugo
   ```

2. **Deploy to GitHub Pages**:
   - Push the `public/` directory to the `gh-pages` branch, or
   - Use GitHub Actions for automatic deployment

### Netlify

1. **Connect your repository** to Netlify
2. **Build command**: `hugo`
3. **Publish directory**: `public`

## 📚 Resources

- [Hugo Documentation](https://gohugo.io/documentation/)
- [Hugo Blox Builder Documentation](https://docs.hugoblox.com/)
- [Academic Theme Guide](https://docs.hugoblox.com/tutorial/)

## 🤝 Contributing

This is a personal website, but if you find any issues or have suggestions, feel free to open an issue or submit a pull request.

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

**Built with ❤️ using Hugo and Hugo Blox Builder**
